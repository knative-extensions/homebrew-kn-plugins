# Retired plugin: kept at its last release and excluded from automated updates.
# Next line is used to identify version of the file.
# source-kamelet_version:1.16.0
require "fileutils"

class SourceKamelet < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-source-kamelet"

  disable! date: "2026-11-01", because: :unmaintained

  v = "knative-v1.16.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-darwin-amd64"
    sha256 "c02f869ecd4c4f628e926776a6c47a79f4193ba3c734c3fd047056092da1be63"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-darwin-arm64"
    sha256 "8bc721d92516f4664d0567abc281b46774b9bfd6c7dc0a999891caea19c38cfb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-linux-arm64"
    sha256 "5f060c5d1222c0a6b1cc69118e319881e566462c552228ee318d4c19977b01a1"
  else
    url "https://github.com/knative-extensions/kn-plugin-source-kamelet/releases/download/#{v}/kn-source-kamelet-linux-amd64"
    sha256 "d05d1e2b68d7a2f90a596b921e9f7dfe6fb859373cd830b7690ac993bb8dc368"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      FileUtils.mv("kn-source-kamelet-darwin-amd64", "kn-source-kamelet")
    elsif OS.mac? && Hardware::CPU.arm?
      FileUtils.mv("kn-source-kamelet-darwin-arm64", "kn-source-kamelet")
    elsif OS.linux? && Hardware::CPU.arm?
      FileUtils.mv("kn-source-kamelet-linux-arm64", "kn-source-kamelet")
    else
      FileUtils.mv("kn-source-kamelet-linux-amd64", "kn-source-kamelet")
    end
    bin.install "kn-source-kamelet"
    
  end

  test do
    system "#{bin}/kn-source-kamelet", "version"
  end
end
