# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# event_version:1.14.0
require "fileutils"

class EventAT114 < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-event"

  v = "knative-v1.14.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-darwin-amd64"
    sha256 "51ed17d9ccf2663dcf48b304cfdb471b5168a6a4c27f532eed50a30e5c7e1057"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-darwin-arm64"
    sha256 "b0281c6b5669ea9b3d6d7dcb7c51bd6be893d1583bbd69aa19f4fb971d69b764"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-linux-arm64"
    sha256 "d3b7dd2a3ed9c0be236648221c050506bd61f4a1edc26bf2c2e411d85b2e003f"
  else
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-linux-amd64"
    sha256 "bdeed47489b80429f3f342e5b3b1e3875ea2fca59e741de3a945a8efa5a25625"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      FileUtils.mv("kn-event-darwin-amd64", "kn-event")
    elsif OS.mac? && Hardware::CPU.arm?
      FileUtils.mv("kn-event-darwin-arm64", "kn-event")
    elsif OS.linux? && Hardware::CPU.arm?
      FileUtils.mv("kn-event-linux-arm64", "kn-event")
    else
      FileUtils.mv("kn-event-linux-amd64", "kn-event")
    end
    bin.install "kn-event"
    
  end

  test do
    system "#{bin}/kn-event", "version"
  end
end
