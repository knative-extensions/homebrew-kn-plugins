require 'fileutils'

class AdminAT110 < Formula
  v = "v1.10.0"
  plugin_name = "admin"
  path_name = "kn-plugin-#{plugin_name}"
  file_name = "kn-#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{path_name}/releases/download/knative-#{v}"

  homepage "https://github.com/knative-sandbox/#{path_name}"

  version v

  if OS.mac?
    url "#{base_url}/#{file_name}-darwin-amd64"
    sha256 "a7a55c363a35eabc05f50159d436699e769a3892fb05c6fdd420eba79cf7e9ab"
  else
    url "#{base_url}/#{file_name}-linux-amd64"
    sha256 "ad040536a6fda39d1605dc364f11b714d668ede4a7a385f06a6e89386f56e751"
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
