require 'fileutils'

class QuickstartAT04 < Formula
  v = "v0.4.1"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "fbb9bf7ed5b599668ff6ba7bc81094a06d3312c433e4fe84523c2304cf2ce0c1"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "3ffb7ccc501b4595e0a695e85cad8575647e490f6c2fcb60b178277562bf619a"
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

