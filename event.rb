# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# event_version:1.19.5
require "fileutils"

class Event < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-event"

  v = "knative-v1.19.5"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-darwin-amd64"
    sha256 "86440b855f37b5532d918bbe2fcf4ced465c2f7b86ba56660cec121be789528b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-darwin-arm64"
    sha256 "dee5bc9ba7d1399810416c91af6f9902e8d93c455ac40447f3ad75f5b41f10c5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-linux-arm64"
    sha256 "50bd83fe228ae006d49584fd4735ee9cebe0e7204d06b1141a6e5e6c0bbbdfb3"
  else
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-linux-amd64"
    sha256 "139fa1b82174e67a9dbfc2cd2c231c41baf277c0ba5611e02cf34b369d576eb4"
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
