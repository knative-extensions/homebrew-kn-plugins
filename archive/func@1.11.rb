require 'fileutils'

class FuncAT111 < Formula
  v = "v1.11.0"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "e8c1fc6c99fbb88e170bdb6b096e0e76fea1d93ea09c8e4db262edeb63cab014"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "aeaa2ae81c3c58daa8c66cd4d4091641308b7356c1474c705e604f0b92b61249"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "37836fd1715d43e209ad6353c7ff41c2e170bdb56d91c03f6d6c88392c7ea4bf"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "191b2981698ffae35172f6b46fae45b7d0d73033f5338a2536a9428fc6754a22"
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

