require 'fileutils'

class Func < Formula
  v = "v1.15.0"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "857b437e93f0124e4b646e937281dc6a10dd6c05b64861e1482af0184fd7faa1"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "74df62ba963a75cee38004e6c7ba734bd6b2038452ab943c9ff7ec53d139c17c"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "3e189118c864d6e23ff162d0a840d28032cba9eb7b3cf3b7fa33afce84696454"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "4860015dbd83c582d9ed5751ebfd814e68cd19639fb82ca65fa2f003b0aecdfc"
    end
  end

  def install
    if OS.mac?
      if `uname -m`.chomp == "arm64"
        FileUtils.mv("func_darwin_arm64", "kn-func")
      else
        FileUtils.mv("func_darwin_amd64", "kn-func")
      end
    end
    if OS.linux?
      if `uname -m`.chomp == "arm64"
        FileUtils.mv("func_linux_arm64", "kn-func")
      else
        FileUtils.mv("func_linux_amd64", "kn-func")
      end
    end
    p "Installing kn-func binary in " + bin
    bin.install "kn-func"
    p "Installing func symlink in " + bin
    ln_s "kn-func", bin/"func"
  end

  test do
    system "#{bin}/kn-func", "version"
  end
end

