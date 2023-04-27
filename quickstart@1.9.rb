require 'fileutils'

class QuickstartAT19 < Formula
  v = "v1.9.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "581719354b42743c7afe8cfc35c56171b8d73973a6dea597c858b6a09bb904d0"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "c0d500828a1e80b793993407d2edcc38c112b3634ea0f679f826de74ae5691da"
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

