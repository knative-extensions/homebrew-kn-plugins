require 'fileutils'

class FuncAT026 < Formula
  v = "v0.25.1"
  plugin_name = "func"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "ba13659893f1e5dd114a4162f2c90ef246ef6e32c6dace22c3b2c3192d107aec"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "84dcbc6245940e5909243bdd93cd35ad2f08737b677a4a043b15f0d278b1c921"
    end
  else
    url "#{base_url}/#{file_name}_linux_amd64"
    sha256 "e51f45ae6708edf8ad6b980e0045b8fdb49b4d31f3e1a70106ade5d11d20c429"
  end

  def install
    if OS.mac?
      if `uname -m`.chomp == "arm64"
        FileUtils.mv("func_darwin_arm64", "kn-func")
      else
        FileUtils.mv("func_darwin_amd64", "kn-func")
      end
    else
      FileUtils.mv("func_linux_amd64", "kn-func")
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

