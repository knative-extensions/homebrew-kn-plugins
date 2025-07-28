# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# event_version:1.18.0
require "fileutils"

class EventAT118 < Formula
  homepage "https://github.com/knative-extensions/kn-plugin-event"

  v = "knative-v1.18.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-darwin-amd64"
    sha256 "d0083062c096d8cfc59675751bb0aca5ffc8b309f52902cb31194d79d05599a6"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-darwin-arm64"
    sha256 "afee7d4a7c5176ff2636f15f79faad3fdf95a314fc9b54564116077b7e1ad645"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-linux-arm64"
    sha256 "33b480a16e5d54b9858bfd928e1a335e950f1468b0e3cef238f2b887341e414a"
  else
    url "https://github.com/knative-extensions/kn-plugin-event/releases/download/#{v}/kn-event-linux-amd64"
    sha256 "d99da4e1969e032f7021b86ac6e6fdf5276e8146ac4c0a848e3748fe470036c2"
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
