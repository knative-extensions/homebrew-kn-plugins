require 'fileutils'

class SourceKameletAT11 < Formula
  v = "v1.1.0"
  plugin_name = "source-kamelet"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "9adccb0c72a337b6f2047560fbd144e8ba5824dc645fc9bf3cc8db892db20d8b"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "8af50bc4f2dc381662aab1f54a86b46150bca99467030fbbbe76891cfd6819af"
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
