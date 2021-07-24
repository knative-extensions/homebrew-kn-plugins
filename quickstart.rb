require 'fileutils'

class Quickstart < Formula
  v = "v0.1.0"
  plugin_name = "quickstart"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "194830717216fc868e453907ab1b11010eccc0a6c7fc890a1833a24b4c9c6176"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "811b7c6ab62ab0f2a8603726f7e5b2764e12beb7e65b8a0385f8436f9fc10538"
  end

  def install
    me = `whoami`.strip
    if OS.mac?
      FileUtils.mkdir_p("/Users/#{me}/.config/kn/plugins")
      FileUtils.mv("kn-quickstart-darwin-amd64", "kn-quickstart")
      bin.install "kn-quickstart"
      system "ln -s #{bin}/kn-quickstart /Users/#{me}/.config/kn/plugins"
    else
      FileUtils.mkdir_p("/home/#{me}/.config/kn/plugins")
      FileUtils.mv("kn-quickstart-linux-amd64", "kn-quickstart")
      bin.install "kn-quickstart"
      system "ln -s #{bin}/kn-quickstart /home/#{me}/.config/kn/plugins"
    end
  end

  test do
    system "kn", "quickstart", "version"
  end
end
