require 'fileutils'

class QuickstartAT111 < Formula
  v = "v1.11.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "0cc699ffd36dda8f5a85addc1eb3e32b864b1c9653f50e40560ef330ea5d59ce"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "6d5ab1c06e8fa3ae88b34c6b39469366d6e1dbd3626e0ce403bcae5ab63496ed"
  end

  def install
    if OS.mac?
      FileUtils.mv("kn-quickstart-darwin-amd64", "kn-quickstart")
    else
      FileUtils.mv("kn-quickstart-linux-amd64", "kn-quickstart")
    end
    bin.install "kn-quickstart"
  end

  test do
    system "#{bin}/kn-quickstart", "version"
  end
end

