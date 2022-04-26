require 'fileutils'

class Func < Formula
  v = "v0.22.0"
  plugin_name = "func"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}_darwin_amd64"
    sha256 "fce001fcc66042d77974a192a133dd11a88fa0efaa03a6167b562c1b35327583"
  else
    url "#{base_url}/#{file_name}_linux_amd64"
    sha256 "778fc94b0351e238ff2804e0bc7306fea65cbaa37ca3619ed22306f249f44a33"
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
