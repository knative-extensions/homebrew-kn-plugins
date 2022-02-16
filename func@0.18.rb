require 'fileutils'

class Func < Formula
  v = "v0.18.0"
  plugin_name = "func"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}_darwin_amd64.gz"
    sha256 "3d1de7fe30cb7a21581f0dd7e554b19b7c343dc43ac555eff9512545fd78722c"
  else
    url "#{base_url}/#{file_name}_linux_amd64.gz"
    sha256 "a332f007531c8ac1ef3fa73e330ea8682e84cffe9a2070dd3af7835380b8553f"
  end

  def install
    if OS.mac?
      FileUtils.mv("func_darwin_amd64", "kn-func")
    else
      FileUtils.mv("func_linux_amd64", "kn-func")
    end
    bin.install "kn-func"
  end

  test do
    system "#{bin}/kn-func", "version"
  end
end
