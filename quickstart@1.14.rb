require 'fileutils'

class QuickstartAT114 < Formula
  v = "v1.14.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "a5fa85cf3b5a01ddb9c62800d27c30f9beee2dd30dc659b8ae7f169862777767"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "723f0369a7a90331b9234fab5349be86e89a5fd6a0a459abbe5f1ee7db2d997c"
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

