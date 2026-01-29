# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# event_version:1.11.0
require "fileutils"

class EventAT111 < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-event"

  v = "knative-v1.11.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-darwin-amd64"
    sha256 "a0ce117fe7f611ed1c91dd48e1ffa775c95a651dbdb57b422257b4ebcf32cd49"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-darwin-arm64"
    sha256 "bd4c231b661d127df8f4615b3948dc1288a6fa3e4c9b044e293c7689ce56d9a5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-linux-arm64"
    sha256 "643d8bd342cf308eda570ee8de325a941dab94d74e3e6fe6f4644cdeef753ba4"
  else
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-linux-amd64"
    sha256 "6b382dbbe6a6c92959e167279a71a27edd50c3ea29c9662f4466f403c0c68d91"
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
