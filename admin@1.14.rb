require 'fileutils'

class AdminAT114 < Formula
  v = "v1.14.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "5d7450582b07ad0d825d6093bd9e1da716e0f4b8c553812db6f90385070504ce"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "bd36720f3d965c4e8aa4d6034f29f802a685b2821041fc5e1a629ae1606fe56a"
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
