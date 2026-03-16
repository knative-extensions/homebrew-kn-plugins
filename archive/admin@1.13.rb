require 'fileutils'

class AdminAT113 < Formula
  v = "v1.13.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "f4d7419b070d04eba985de8f0c04648dad0b3c11b40b715d0d8dfda378a94c62"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "c92e4932f5b317f2554f220fdb124fd8e84305286bcc4a03cf97bf27cdbec122"
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
