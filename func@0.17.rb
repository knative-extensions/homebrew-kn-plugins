require 'fileutils'

class FuncAT017 < Formula
  v = "v0.17.1"
  plugin_name = "func"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}_darwin_amd64.gz"
    sha256 "f83d1ff15045cd882fedda4944581d5e3084a82d68a309b4c5c900af91968e11"
  else
    url "#{base_url}/#{file_name}_linux_amd64.gz"
    sha256 "2d324d0303605814f37deada0fe1317f1812875ba6bba901808b2ad69381723a"
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
