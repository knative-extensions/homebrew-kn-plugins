require 'fileutils'

class QuickstartAT16 < Formula
  v = "v1.6.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "f94bcbb5ea753342142eba6beae4047c2cc10cf03045c4ffaca9bf0f78129781"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "b1648c35455355fcc418efeda91ddf58987ed41b29f18f5bd9d39b1e1619a91e"
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

