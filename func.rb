require 'fileutils'

class Func < Formula
  v = "knative-v1.7.0"
  plugin_name = "func"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "d2ab0de9c3b058e1a27b0cb2cb8a2a630b6526d2e8de9571c9894813faabf69d"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "80d0f6350c5d222259c22531fadddcca86339581efe455149b970648f5a2dd40"
    end
  else
    url "#{base_url}/#{file_name}_linux_amd64"
    sha256 "1b0f2f9a357cb930a4c256620018b25adb634547a8fb315ddc303f150d4cf7f3"
  end

  def install
    if OS.mac?
      if `uname -m`.chomp == "arm64"
        FileUtils.mv("func_darwin_arm64", "kn-func")
      else
        FileUtils.mv("func_darwin_amd64", "kn-func")
      end
    else
      FileUtils.mv("func_linux_amd64", "kn-func")
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

