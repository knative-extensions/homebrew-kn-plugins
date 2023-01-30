require 'fileutils'

class SourceKameletAT18 < Formula
  v = "v1.8.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "14c53cb8c7acb61dc2a39347311366ac189e81b0a42436c94a9ba817793f5869"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "dc0a7c904ddb22d5b86c26cacd310511038c80c1d4c8febbbafe775fee7bbedb"
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
