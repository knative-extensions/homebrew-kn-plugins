require 'fileutils'

class Quickstart < Formula
  v = "v1.7.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "3f94c00222a62d634faa0fa163fabd5cc7eccff5800a9260a5f04d45005c401f"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "c54290cfbda6604ed106868de4ec755cf6f7e56a01676d56c859e1a14edfc44b"
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

