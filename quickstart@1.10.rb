require 'fileutils'

class QuickstartAT110 < Formula
  v = "v1.10.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "1b3ff80c3d07a26b65fb551eaa76d0560841de13371fd40dc790ea67edf83468"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "6ab28b80fa584c2a99431974cacbd2fc5bc165eb35b31ef9d78219d69a02b010"
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

