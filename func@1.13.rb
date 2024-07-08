require 'fileutils'

class FuncAT113 < Formula
  v = "v1.13.0"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "cd00b1f6961b32f87c301d9c5c99df123097a171784a11ab7f04edcfa5493d03"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "40532e79235b153f128cbd3bd9a768683b63a5bfcc48c1a17fdca20c1ff7f086"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "6a02fe14bbebcd1be2ce36ab6d40890d37b0daf36c64db92774a505487641b21"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "de01151c542cf4868689dbde561ad2e69e4cdbfe198c4b86e81a139c3537d615"
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

