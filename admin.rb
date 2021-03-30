if OS.mac?
  require "FileUtils"
else
  require "fileutils"
end

class Admin < Formula
  v = "v0.21.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "9a10e1b0ff9a035d88b6d69d5d7bf235de8a2b4b1002062688e104fe936f4161"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "05badf881ac18f7fb4d567b995d98f480a080ed5e64728882392af65db28dfa6"
  end

  def install
    if OS.mac?
      FileUtils.mv("kn-admin-darwin-amd64", "kn-admin")
    else
      FileUtils.mv("kn-admin-linux-amd64", "kn-admin")
    end
    bin.install "kn-admin"
  end

  test do
    system "#{bin}/kn-admin", "version"
  end
end