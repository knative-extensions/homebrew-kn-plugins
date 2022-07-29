require 'fileutils'

class FuncAT024< Formula
  v = "v0.24.0"
  plugin_name = "func"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    if `uname -m`.chomp  == "arm64"
      url "#{base_url}/#{file_name}_darwin_arm64"
      sha256 "969b7ec3494d13e699038e75f3210e81313fa103b65f10b45e7e7d9a370cadbb"
    else
      url "#{base_url}/#{file_name}_darwin_amd64"
      sha256 "5e83fd1fb52b742c2e985df785ab52ab42d8c4cee7eec7706699f014bfb39aca"
    end
  else
    url "#{base_url}/#{file_name}_linux_amd64"
    sha256 "3244c3c5ac346b950d78c9bb2267ee88606fb0a971d4a51a0973a323f1d6090d"
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

