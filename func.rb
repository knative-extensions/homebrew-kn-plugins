require 'fileutils'

class Func < Formula
  v = "v1.8.0"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "2dbb88b62b7f35c597f6c1bdbb8576be53aa49ac9978d2e6ae65e9b75246b8df"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "53d786383a1aa138e507cbb71b2d4c5ede5df601ae6d5f1a8316e17a13817f35"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "bf051268651ad5bed2f6298b6e6e4e3a422235a46fa3a4d731d1b47324118f82"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "a5010db6d20c76a078fc880bfa08be1a09cdddf8226095475c018ac3175a6ff4"
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

