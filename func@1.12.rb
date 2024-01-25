require 'fileutils'

class FuncAT112 < Formula
  v = "v1.12.0"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "84682105d562611f515dc8cd83f0761bfe0b35dab5a1961b48b1414b1d6a191b"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "46a3a7dada63f9285d93b24f393ccff99125b4e3980139e43aa04b0f17e2dfd6"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "fff8871edbe4667f095df0f242e7cc52ecd92350197a066fb1a62fdcaf4e7ed1"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "cb9cfe6772273a0b0c2d0736b7366ec515819a8a0a0cfeb2c7f50aa4ac845ca1"
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

