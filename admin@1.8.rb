require 'fileutils'

class AdminAT18 < Formula
  v = "v1.8.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "792581a98dc7755112d7a36cd43556d843f56d079f4678aedcc73be076def5ed"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "a1db0aaee4a05bd454ed690cedf59d2068ad7a9fa7c8707451d7a70ea8c7429b"
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
