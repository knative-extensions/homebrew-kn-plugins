require 'fileutils'

class QuickstartAT02 < Formula
  v = "v0.2.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "7309abe34aacab5dd7c03460765869f6a2db2132791d94e8b7346a3e70a8d5cd"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "eb53ac8c233be5c3e4ecdf396f8d1f8c3c673091589b038c53c66be2be68593b"
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

