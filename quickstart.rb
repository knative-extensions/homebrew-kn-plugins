require 'fileutils'

class Quickstart < Formula
  v = "v1.15.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "ac485e9320d125c913c6cc54bf9eaef61207ec803750eaa7a048a654681441df"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "5a2ef86aa572f20a3a7fea538f13c3838514b2c9a89946bfe93bdd68a3803d0b"
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

