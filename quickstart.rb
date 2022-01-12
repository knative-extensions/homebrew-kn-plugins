require 'fileutils'

class Quickstart < Formula
  v = "v1.1.1"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "80908cc55093104b2ff071b489eec618036a0e46fe90929b04ad511aa00f323a"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "083af29628bdeb3e8c3316e44a6dae69af48728e3ab167118a951387d915762b"
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

