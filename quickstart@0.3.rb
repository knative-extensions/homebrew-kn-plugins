require 'fileutils'

class QuickstartAT03 < Formula
  v = "v0.3.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "d94b8ee11b7bb207b060f4c723d0f09ae07357b99df0630465006d89f659ad87"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "952a7016a4be1b40628b96888bbaf5a7dcccd672b4d0cc95ab4d1fd0fcd5f26d"
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

