require 'fileutils'

class AdminAT11 < Formula
  v = "v1.1.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "a138a253b511aa9be49dc7b4e4380ef8351a4e96f66b86c32b62ad7af8728050"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "95bf86b135d877d4e18455ca31709921c94dd9ccd96d4809844d0c4f816ce70e"
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
