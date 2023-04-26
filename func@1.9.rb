require 'fileutils'

class Func < Formula
  v = "v1.9.4"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "e470d4d7e4b6f9a7b84aeb0f2f25a0c5aca91038a5f478fbe62ec8c48f5994d8"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "5d900113fca7fe195e8823e29e8ee64c66ba607520427d57394cb663b6f74f95"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "704de4bb66196810d98d11be62b6fc9e159a0ef7aa955297800f9121ace5f898"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "8787ee6c22b01fcb7f30041934eca7dc9364dae963492e653e78eb623687e906"
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

