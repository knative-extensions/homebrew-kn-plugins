require 'fileutils'

class QuickstartAT14 < Formula
  v = "v1.4.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "61f6855f4f54fb4564b18ef764c88a41bf1ab277e996f19a8513f1bf360dd9cd"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "2a282bb90bf9993119cbff2c93cbadab0d98ecf10a2f0eb78e5d432e2720b385"
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

