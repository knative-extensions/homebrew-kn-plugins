require 'fileutils'

class QuickstartAT10 < Formula
  v = "v1.0.1"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "7bfe27385902bbbc5e2b557bab0325147ea43121926727295a8ecc57c94be140"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "d0c329a518aa9bd0f3d615871d1ba02173cc2662a499f0cf7554a89f82128431"
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

