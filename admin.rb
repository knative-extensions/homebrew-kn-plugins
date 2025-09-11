# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# admin_version:1.19.4
require "fileutils"

class Admin < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-admin"

  v = "knative-v1.19.4"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-darwin-amd64"
    sha256 "8d46dfd3341ffcdaec6119c71b4c6cd2f3a67225d3d09065fffa62ad2c180b34"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-darwin-arm64"
    sha256 "272e6b4a3133f43de5b04e9e20e62ab7ad7b5cc99c8074fec79253c8e497284f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-linux-arm64"
    sha256 "b28161a74b2cec1a463bae5285837395649a07469e0cf340b1b777e16f95a390"
  else
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-linux-amd64"
    sha256 "112e556958884c717556aa3b8cdd65ad2257facd2b42a90f7f23e5f45f2aaab2"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      FileUtils.mv("kn-admin-darwin-amd64", "kn-admin")
    elsif OS.mac? && Hardware::CPU.arm?
      FileUtils.mv("kn-admin-darwin-arm64", "kn-admin")
    elsif OS.linux? && Hardware::CPU.arm?
      FileUtils.mv("kn-admin-linux-arm64", "kn-admin")
    else
      FileUtils.mv("kn-admin-linux-amd64", "kn-admin")
    end
    bin.install "kn-admin"
    
  end

  test do
    system "#{bin}/kn-admin", "version"
  end
end
