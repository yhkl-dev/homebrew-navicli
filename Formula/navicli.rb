class Navicli < Formula
  desc "A lightweight command line music player for Navidrome"
  homepage "https://github.com/yhkl-dev/NaviCLI"
  url "https://github.com/yhkl-dev/NaviCLI/releases/download/v1.0.5/release.tar.gz"
  sha256 "3bea982490aeb77d13a22b9510b4a37fab2ac1756579727cc037e24ab5a9b32c"
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
