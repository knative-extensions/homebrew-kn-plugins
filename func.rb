require 'fileutils'

class Func < Formula
  v = "v1.8.1"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "b78950bf0879708003c0952371c8a05e4a28e6d00d3b9ff657fadae9fbee6360"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "778878ff6e94fc2d978245397150385c5c48323e643358f471e858515600c010"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "e8ebe0a82baac9f878c7ce646c0ad54c5f755525c65e3174f4631ea0b9ced948"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "e45bb1b3c23d7dc4d7a952caced6c728f8f7062595b8556c067c74fe839ef286"
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

