require 'fileutils'

class Func < Formula
  v = "v1.9.1"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "26c20dbf4ee334df5de421ebcfbd396f382783e1395b0f133a3cb420db44fa63"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "93837b3f44ed13d218eea068c7fbc39130bb08f3c67739c2358199bdf3d35edd"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "523762aa0cb18b7685c53a2244be1594ac5552346107d265e6aaf5f0f6f07534"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "6ba8ef290e8f46bb39be5f3c07d7941c13e9e33ae4c579f94c18046077d7ae98"
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

