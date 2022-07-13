require 'fileutils'

class QuickstartAT15 < Formula
  v = "v1.5.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "5f7511eb047b1615cc45b9925c9c30ee7e8e3154d9b467ce85143a965fcdb7fb"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "3d38058255558abe1c86cada649df2b75ef18a3cc769ccc3db95bf77093e9d3f"
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

