require 'fileutils'

class QuickstartAT13 < Formula
  v = "v1.3.1"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "bd0428cb8903a58da9036b69a4815bddf92ac5d88797e4d09b5a2bd103b0b7a0"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "73b646432c297a2dc3bfa0b17401f4737e250ceccb7a6f38b96af7e8ed4bb890"
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

