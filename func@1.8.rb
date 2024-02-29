require 'fileutils'

class FuncAT18 < Formula
  v = "v1.8.2"
  plugin_name = "func"
  path_name = "#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "5ab2906f88029d707cf0289d0cc5d6c8e1334459c2e714839def8892f53114a5"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "08051d854ac99cca0d94bea4c19bc9d80e1f867c9a7ca092a2cfa2912975391d"
    end
  end

  if OS.linux?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_linux_arm64"
      sha256 "f81ab52904a3a7ab34b83af15f44af11ab7a7c17292a779f66f16ef48e363ff1"
    else
      url "#{base_url}/#{file_name}_linux_amd64"
      sha256 "df33384c893a201473b004ca9f3eb78cd32b7981438da0da0de48e419203d103"
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

