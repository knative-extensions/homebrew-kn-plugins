# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# admin_version:1.21.0
require "fileutils"

class AdminAT121 < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-admin"

  v = "knative-v1.21.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-darwin-amd64"
    sha256 "891d819c4c724a404367602d2cf032a001e6ea53ea849e1bbc3a64a799523d38"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-darwin-arm64"
    sha256 "13675a496978caad2128674a03bae2bf800ddd4ba41665baaf55cd56e2710a1a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-linux-arm64"
    sha256 "f7e19ee482e6b42c416e104bbff7cd9edef5b4ab86c8b9be925f73d0c4471749"
  else
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-linux-amd64"
    sha256 "4c175d6d428824d2f719741d5ff8ce007f1dd7a4537a85aeea3ceb6182d5d193"
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
