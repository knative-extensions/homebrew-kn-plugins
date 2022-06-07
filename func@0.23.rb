require 'fileutils'

class Func < Formula
  v = "v0.23.1"
  plugin_name = "func"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "05f20523872f94540be222c1c6ecf7dca86e7c909ae6c7f0a12ff5bbbf064eb9"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "47424efa16ba064efd8348bf6fb85396d0a3771e648435ba051d466b721111da"
    end
  else
    url "#{base_url}/#{file_name}_linux_amd64"
    sha256 "fea929a0d4a29fd1e8fd81c96d7c1b5e96756138077b29459db33772a2e17105"
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

