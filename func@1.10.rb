require 'fileutils'

class FuncAT110 < Formula
  v = "v1.10.1"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "a30420514bdc88178a65fb3321f0841a582be23715c5c8028302d1d433186487"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "6ff69e2b2f763c5e0182dc5bf43e8552b60b8951c8c60d943c159277f2ae5f5b"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "7e9cc650cc0d827a0bf5ba8f9e1fc549aa13d8050eb31a65564ca09691122218"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "1a8cfb70045a3afe6fa6f663085d5d971d84ea7ef714852980780765952b0901"
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

