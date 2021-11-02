require 'fileutils'

class Quickstart < Formula
  v = "v1.0.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "78a5ae80e5c190c0e9af3c9f7bad863eeb11627c5003076cdf6805a35b5d4ee3"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "97004ccb9aaa64edfac04f2377eb1a9643feee4dc2ff6ba4e506953d7418e547"
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

