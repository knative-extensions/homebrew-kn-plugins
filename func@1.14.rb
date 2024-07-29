require 'fileutils'

class FuncAT114 < Formula
  v = "v1.14.0"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "5c6afbc75df69518b2a8fc438991c18fd4f0b0bc22e0d0da8fb26cb9495b8da5"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "bd68e6c409e1c1f7df36ecd34e5045fb7cfb952e32b7233bc19c7db640651aef"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "f3afd2875af9e61d161b3b12f58fb061508c6c3bd2abb6600855dabba28e6424"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "286b7a22ffd196ef113dd08f29859d2b8e2ac1eed06115947824d5a6236b7674"
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

