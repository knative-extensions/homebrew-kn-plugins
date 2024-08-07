#! /usr/bin/env bash

# Copyright 2024 The Knative Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

# Retrieve latest version from given Knative repository tags
# On 'main' branch the latest released version is returned
# On 'release-x.y' branch the latest patch version for 'x.y.*' is returned
# Similar to hack/library.sh get_latest_knative_yaml_source()
function get_latest_release_version() {
    local org_name="$1"
    local repo_name="$2"
    local major_minor=""
    local version
    version="$(git ls-remote --tags --ref https://github.com/"${org_name}"/"${repo_name}".git \
      | grep "${major_minor}" \
      | cut -d '-' -f2 \
      | cut -d 'v' -f2 \
      | sort -Vr \
      | head -n 1)"
    echo "${version}"
}

# Return the major version of a release.
# For example, "v0.2.1" returns "0"
# Parameters: $1 - release version label.
function major_version() {
  local release="${1//v/}"
  local tokens=(${release//\./ })
  echo "${tokens[0]}"
}

# Return the minor version of a release.
# For example, "v0.2.1" returns "2"
# Parameters: $1 - release version label.
function minor_version() {
  local tokens=(${1//\./ })
  echo "${tokens[1]}"
}

# Return the release build number of a release.
# For example, "v0.2.1" returns "1".
# Parameters: $1 - release version label.
function patch_version() {
  local tokens=(${1//\./ })
  echo "${tokens[2]}"
}

# Generate file based on the inlined HEREDOC template.
function generate_tap_file() {
  local out=$1
  local name=${1%%.*}
  name=${name%%@*}
  local version=$2
  local old_formula=${3:-""}
  local darwin_amd64_checksum darwin_arm64_checksum linux_amd64_checksum linux_arm64_checksum
  local darwin_amd64_binary darwin_arm64_binary linux_amd64_binary linux_arm64_binary

  # Fetch checksum file from release and parse values
  checksums=$(mktemp)
  repo_url="https://github.com/knative-extensions/kn-plugin-${name}"
  darwin_amd64_binary="kn-${name}-darwin-amd64"
  darwin_arm64_binary="kn-${name}-darwin-arm64"
  linux_amd64_binary="kn-${name}-linux-amd64"
  linux_arm64_binary="kn-${name}-linux-arm64"
  extra_args=""

  if [[ "${name}" == "func" ]]; then
    repo_url="https://github.com/knative/${name}"
    darwin_amd64_binary="${name}_darwin_amd64"
    darwin_arm64_binary="${name}_darwin_arm64"
    linux_amd64_binary="${name}_linux_amd64"
    linux_arm64_binary="${name}_linux_arm64"

    extra_args='ln_s "kn-func", bin/"func"'
  fi

  curl -fsSL "${repo_url}/releases/download/knative-v${2}/checksums.txt" > "$checksums"
  darwin_amd64_checksum=$(awk '$2=="'${darwin_amd64_binary}'"{print $1}' "$checksums")
  darwin_arm64_checksum=$(awk '$2=="'${darwin_arm64_binary}'"{print $1}' "$checksums")
  linux_amd64_checksum=$(awk '$2=="'${linux_amd64_binary}'"{print $1}' "$checksums")
  linux_arm64_checksum=$(awk '$2=="'${linux_arm64_binary}'"{print $1}' "$checksums")
  # Cleanup temp file
  rm "${checksums}"

  # Sanitize name to be class name
  local className=${name^}
  if [[ "${name}" == "source"* ]]; then
    className=$(echo "${name}" | tr "-" " " | sed -e 's/\b./\U&/g' | tr -d " ")
  fi

cat <<EOF > "$out"
# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# ${name}_version:${version}
require "fileutils"

class ${className^}${old_formula} < Formula
  homepage "${repo_url}"

  v = "knative-v${version}"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "${repo_url}/releases/download/#{v}/${darwin_amd64_binary}"
    sha256 "${darwin_amd64_checksum}"
  elsif OS.mac? && Hardware::CPU.arm?
    url "${repo_url}/releases/download/#{v}/${darwin_arm64_binary}"
    sha256 "${darwin_arm64_checksum}"
  elsif OS.linux? && Hardware::CPU.arm?
    url "${repo_url}/releases/download/#{v}/${linux_arm64_binary}"
    sha256 "${linux_arm64_checksum}"
  else
    url "${repo_url}/releases/download/#{v}/${linux_amd64_binary}"
    sha256 "${linux_amd64_checksum}"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      FileUtils.mv("${darwin_amd64_binary}", "kn-${name}")
    elsif OS.mac? && Hardware::CPU.arm?
      FileUtils.mv("${darwin_arm64_binary}", "kn-${name}")
    elsif OS.linux? && Hardware::CPU.arm?
      FileUtils.mv("${linux_arm64_binary}", "kn-${name}")
    else
      FileUtils.mv("${linux_amd64_binary}", "kn-${name}")
    end
    bin.install "kn-${name}"
    ${extra_args}
  end

  test do
    system "#{bin}/kn-${name}", "version"
  end
end
EOF
}

# The script is meant to be executed though GH action to generate content update and review in the PR.

[[ ! -v REPO_ROOT_DIR ]] && REPO_ROOT_DIR="$(git rev-parse --show-toplevel)"
readonly REPO_ROOT_DIR

# If OVERRIDE_RELEASE_VERSION is provided only kn.rb file is regenerated based on the provided value.
# Accepts plain numeric semver with or without leading v, e.g. `1.13.0` and `v1.13.0`.
# In addition also Knative tag format `knative-v1.y.z` as well, e.g. `knative-v1.13.0`
# Variant for older version won't be created.
readonly OVERRIDE_RELEASE_VERSION=${OVERRIDE_RELEASE_VERSION:-}

pushd $REPO_ROOT_DIR

# Update plugin according release requirements
PLUGINS=("admin" "event" "func" "quickstart" "source-kafka" "source-kamelet")

for plugin in "${PLUGINS[@]}"; do
  echo "${plugin}"

  # Override version branch
  if [[ -n "${OVERRIDE_RELEASE_VERSION}"  ]]; then
    version_string=${OVERRIDE_RELEASE_VERSION##knative-v}
    version_string=${version_string##v}
    echo "Generating ${plugin}.rb based on provided override version: ${version_string}"
    generate_tap_file "${plugin}.rb" "${version_string}"

    exit 0
  fi

  # Get sem ver from ${plugin}.rb file, in format x.y.z
  current_homebrew_version=$(cat "${plugin}.rb" | grep "${plugin}_version:" | cut -d ':' -f2)
  # Get latest released version from knative/client git repository
  if [[ "${plugin}" == "func" ]]; then
    latest_release_version=$(get_latest_release_version "knative" "${plugin}")
  else
    latest_release_version=$(get_latest_release_version "knative-extensions" "kn-plugin-${plugin}")
  fi

  # Assume major_version is always equal '1'
  if (( $(minor_version "$current_homebrew_version") == $(minor_version "$latest_release_version") )); then
    if (( $(patch_version "$current_homebrew_version") == $(patch_version "$latest_release_version") )); then
      echo "Current ${plugin}.rb in up to date with latest release: ${latest_release_version}"
      echo "No changes made."
      continue
    else
      echo "Newer patch release is available: ${latest_release_version}"
      # Regenerate main kn.rb file to update patch version
      generate_tap_file "${plugin}.rb" "${latest_release_version}"
    fi
  else
    echo "Newer release is available: ${latest_release_version}"

    # Generate definition for older release first
    current_minor=$(minor_version "$current_homebrew_version")
    old_file="${plugin}@1.${current_minor}.rb"
    generate_tap_file "${old_file}" "${current_homebrew_version}" "AT1${current_minor}"

    # Regenerate the main kn.rb file
    generate_tap_file "${plugin}.rb" "${latest_release_version}"
  fi


done



