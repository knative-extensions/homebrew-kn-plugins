# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# event_version:1.21.0
require "fileutils"

class EventAT121 < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-event"

  v = "knative-v1.21.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-darwin-amd64"
    sha256 "f0bd1fec779bfdccb9963ae60fd801961302e47c2b4ab4aef54de6b32f0526cd"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-darwin-arm64"
    sha256 "c7e20db3537ab8987b5d0916e7e00f03371d79996ff7d84149a09173e868c2d3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-linux-arm64"
    sha256 "b54221cead37fc3044b4c871b0d4ab604a5820c210645039ef95d63d37e300e6"
  else
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-linux-amd64"
    sha256 "10908cc8d0deb1c792fdad1a3f155a6c5f238a511a79b2cc64d001cb39291294"
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
