# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# quickstart_version:1.19.1
require "fileutils"

class Quickstart < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-quickstart"

  v = "knative-v1.19.1"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-darwin-amd64"
    sha256 "a0129e79854ff207b656840523359bed61099445e28c312dbab058a7bc25800e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-darwin-arm64"
    sha256 "8e0d2f3569bebf042323b793384734d0bdd28529773b3ee23a530a60715a7e4c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-linux-arm64"
    sha256 "fa380d0507611b704509d0e0f1dd3d94180a76f5fbc1411aac6f4dd49607232f"
  else
    url "https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/#{v}/kn-quickstart-linux-amd64"
    sha256 "4837439a58fa6f4e24dd7b58b6db212b809dcb0a67d3290a368ee32a83314425"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      FileUtils.mv("kn-quickstart-darwin-amd64", "kn-quickstart")
    elsif OS.mac? && Hardware::CPU.arm?
      FileUtils.mv("kn-quickstart-darwin-arm64", "kn-quickstart")
    elsif OS.linux? && Hardware::CPU.arm?
      FileUtils.mv("kn-quickstart-linux-arm64", "kn-quickstart")
    else
      FileUtils.mv("kn-quickstart-linux-amd64", "kn-quickstart")
    end
    bin.install "kn-quickstart"
    
  end

  test do
    system "#{bin}/kn-quickstart", "version"
  end
end
