# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# func_version:1.19.3
require "fileutils"

class Func < Formula
  homepage "https://github.com/knative/func"

  v = "knative-v1.19.3"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative/func/releases/download/#{v}/func_darwin_amd64"
    sha256 "ccc76962c9d7933a2ac5224c79e13d956b8474b444dc20f5543141df26bc0224"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative/func/releases/download/#{v}/func_darwin_arm64"
    sha256 "9ca05caa03cac4197ca6771399657d32d4aabe2ebb9a3794cf669c604ad8fec2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative/func/releases/download/#{v}/func_linux_arm64"
    sha256 "a4074d1ca33a4b02cc091862d882a50b6c1249c29801183e54f640e69212eaa3"
  else
    url "https://github.com/knative/func/releases/download/#{v}/func_linux_amd64"
    sha256 "ca05a7b933d7b35a45ff6ecb1d59d8955bae4ee410de175fa0ab76c96ffb048f"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      FileUtils.mv("func_darwin_amd64", "kn-func")
    elsif OS.mac? && Hardware::CPU.arm?
      FileUtils.mv("func_darwin_arm64", "kn-func")
    elsif OS.linux? && Hardware::CPU.arm?
      FileUtils.mv("func_linux_arm64", "kn-func")
    else
      FileUtils.mv("func_linux_amd64", "kn-func")
    end
    bin.install "kn-func"
    ln_s "kn-func", bin/"func"
  end

  test do
    system "#{bin}/kn-func", "version"
  end
end
