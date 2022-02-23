require 'fileutils'

class FuncAT021 < Formula
  v = "v0.21.2"
  plugin_name = "func"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}_darwin_amd64"
    sha256 "2d21429d8c9d8b7a4fda958ec210765ec8d03729cd130a68ab6a6d0c50a29479"
  else
    url "#{base_url}/#{file_name}_linux_amd64"
    sha256 "70d22e96cde36809e9681b7cec891f0a63d96c84a4eede0de727aadca42bd363"
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
