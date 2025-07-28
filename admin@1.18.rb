# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# admin_version:1.18.0
require "fileutils"

class AdminAT118 < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-admin"

  v = "knative-v1.18.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-darwin-amd64"
    sha256 "d2f92dbdb262ba7d0e8ea3b3057630fce89faeac8e081727c954d87a414b0e9e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-darwin-arm64"
    sha256 "1f35b3ef738ba40acceef263d01f57e765f0a8e2fc1bcbd4c393f633ff9a1ea7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-linux-arm64"
    sha256 "566326c3b6e6c1ca12f5fc966f71e26361d2134c3c8b17ad0acecac43b54f41b"
  else
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-linux-amd64"
    sha256 "6dfc91107470e3557858d880f64b176337dc44b32ab18d4589288037fa2453fc"
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
