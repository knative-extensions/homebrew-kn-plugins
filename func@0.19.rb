require 'fileutils'

class Func < Formula
  v = "v0.19.0"
  plugin_name = "func"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}_darwin_amd64.gz"
    sha256 "42d6f491a2cead97a5fe70a20ada0580acbcddb36628f3571c2afe73e6d6a852"
  else
    url "#{base_url}/#{file_name}_linux_amd64.gz"
    sha256 "36a3631f79fea45ec9b6958a559fd74947ad562bdc1d7f23548e51aa322d4c3b"
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
