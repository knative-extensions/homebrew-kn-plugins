# Generated through hack/update-codegen.sh. Don't edit manually.
# Next line is used to identify version of the file.
# func_version:1.21.2
require "fileutils"

class Func < Formula
  homepage "https://github.com/knative/func"

  v = "knative-v1.21.2"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative/func/releases/download/#{v}/func_darwin_amd64"
    sha256 "6e50dd1cad68b6a2d2ab932c43adf91fce9f3eea3463fb05353453eb86263482"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative/func/releases/download/#{v}/func_darwin_arm64"
    sha256 "cace4097e1accaf984a368f1e5f924d9c24e960b752ddd3c003592198f24f07a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative/func/releases/download/#{v}/func_linux_arm64"
    sha256 "e697e07694c5ed9fdd2ee573e3bdef0c1b94e061e593617c04859833d42e66a7"
  else
    url "https://github.com/knative/func/releases/download/#{v}/func_linux_amd64"
    sha256 "e3815dcdc47eb6199b50ee617dc2be9a14bed215251894e53dd3cfcfd73de7a3"
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
