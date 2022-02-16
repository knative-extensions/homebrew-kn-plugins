require 'fileutils'

class Func < Formula
  v = "v0.20.0"
  plugin_name = "func"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}_darwin_amd64"
    sha256 "55713f462b229d2de95d79ef38bc61131ddfb7c4ec2e90d3e670349ee4baa564"
  else
    url "#{base_url}/#{file_name}_linux_amd64"
    sha256 "d5a08cc7b9e2f1036072ca03cbc83b462c22f356e520b1aa94a7582acf16af1a"
  end

  def install
    if OS.mac?
      FileUtils.mv("func_darwin_amd64", "kn-func")
    else
      FileUtils.mv("func_linux_amd64", "kn-func")
    end
    bin.install "kn-func"
  end

  test do
    system "#{bin}/kn-func", "version"
  end
end
