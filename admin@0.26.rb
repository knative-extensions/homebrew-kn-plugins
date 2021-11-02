require 'fileutils'

class AdminAT26 < Formula
  v = "v0.26.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "9ad5c76e4de0e56dad21120266a928301dd655e1d7b25200028bdbde7f1e2460"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "8171613d7862b4d4854660134b350e4d62a882b0f28fe23eae42ab218137a583"
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
