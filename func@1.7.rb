require 'fileutils'

class FuncAT17 < Formula
  v = "v1.7.1"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "cffe2b6ed5845651ac62dc8fc72c435e3042bb9b1cd2a94e1d4ef65c59841d8e"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "542b134cba4835fb452546829a84a1c8a3b44ee778c57585bf6d3c19c8ff00d0"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "a49048728473f5399b9fbd4ff9de33c7ba92427da6037363c4d6fb393e539d91"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "c6981cba72ad9265e1290fcdd819ff4017595925554a881bcb53fb8a5ef55eb9"
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

