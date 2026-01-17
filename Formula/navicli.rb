class Navicli < Formula
  desc "A lightweight command line music player for Navidrome"
  homepage "https://github.com/yhkl-dev/NaviCLI"
  url "https://github.com/yhkl-dev/NaviCLI/releases/download/v2.0.1/release.tar.gz"
  sha256 "de6f10aae2339637300aa618b061e644f637da81e2ebc22f6c30a2c793b48c69"
  license "MIT"
  depends_on "mpv"

  def install
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3 等)
      bin.install "navicli-darwin-arm64" => "navicli"
    else
      # Intel Mac
      bin.install "navicli-darwin-amd64" => "navicli"
    end
  end

  test do
    # 测试二进制文件是否存在
    assert_predicate bin/"navicli", :exist?
  end
end
