require 'fileutils'

class SourceKamelet < Formula
  v = "v1.15.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "c73c6c91072e7c0711c3009142568acbbe15e14d7d06eee227524a0eed92bc3a"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "4540e8abb1e735631485cbd362b121e817f8f1d36c6282ffada1f59d8d9eeffa"
  end

  def install
    if OS.mac?
      FileUtils.mv("kn-source-kamelet-darwin-amd64", "kn-source-kamelet")
    else
      FileUtils.mv("kn-source-kamelet-linux-amd64", "kn-source-kamelet")
    end
    bin.install "kn-source-kamelet"
  end

  test do
    system "#{bin}/kn-source-kamelet", "version"
  end
end
