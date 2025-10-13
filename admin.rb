# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# admin_version:1.19.5
require "fileutils"

class Admin < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-admin"

  v = "knative-v1.19.5"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-darwin-amd64"
    sha256 "170981648b9a4374d486463e46af6657f337c9286745303e5b940c8f6e6ab208"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-darwin-arm64"
    sha256 "0554de93558ae04bf68cfc0bd6329388a7ecd6c56a236117891b591eaf417983"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-linux-arm64"
    sha256 "6043e1b0fd32a45ada8de148c859dfbacc0bed11c6266aad91fee11991f84061"
  else
    url "https://github.com/knative-extensions/kn-plugin-admin/releases/download/#{v}/kn-admin-linux-amd64"
    sha256 "3b8d7a6f69b68366598e67fde72dbd8b82919ce888f3555db3c3f266af49b8fc"
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
