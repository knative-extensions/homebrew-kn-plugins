# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# admin_version:1.20.0
require "fileutils"

class AdminAT120 < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-admin"

  v = "knative-v1.20.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-darwin-amd64"
    sha256 "7f9ca9c8dbf38beb332a5ad089c33de2221dbf1d90282a64480dc8aae17edaf6"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-darwin-arm64"
    sha256 "8161f89e3899c4dbce89b2fdd6d3077ead52cc68a2edd8fa97e32b4a8cd76c7b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-linux-arm64"
    sha256 "a8062877d036a92a735b0ad2ca59f656e6453b78d1fba84455bdc8efc62c4d6e"
  else
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-linux-amd64"
    sha256 "0c93af3b0e21a1d3674b79e3d2b0ed77bff34017ca3356a16360389fa7e9977c"
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
