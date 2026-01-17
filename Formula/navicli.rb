class Navicli < Formula
  desc "A lightweight command line music player for Navidrome"
  homepage "https://github.com/yhkl-dev/NaviCLI"
  url "https://github.com/yhkl-dev/NaviCLI/releases/download/v2.0.0/release.tar.gz"
  sha256 "c708febd73b1f4907fe70a1b9982e8beeabb0edb30f01c378e06c8a42c0a793d"
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
