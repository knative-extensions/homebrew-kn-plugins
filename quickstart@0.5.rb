require 'fileutils'

class QuickstartAT05 < Formula
  v = "v0.5.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "4b487e14b712844eace1e61f28060f97b7699dc7ab5f8c00f89818236819d3f5"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "2efb28d53a158ebd9e4a4cdb9b54a58f505561398fcb5a529a4c6b3f4a903dbb"
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

