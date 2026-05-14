class Navicli < Formula
  desc "A lightweight command line music player for Navidrome"
  homepage "https://github.com/yhkl-dev/NaviCLI"
  url "https://github.com/yhkl-dev/NaviCLI/releases/download/v2.2.1/release.tar.gz"
  sha256 "c1f38448a5c3875ebede555ae2c412636490a527bf07701896462b07d5c23c30"
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
    assert_predicate bin/"navicli", :exist?
  end
end
