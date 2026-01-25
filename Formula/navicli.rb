class Navicli < Formula
  desc "A lightweight command line music player for Navidrome"
  homepage "https://github.com/yhkl-dev/NaviCLI"
  url "https://github.com/yhkl-dev/NaviCLI/releases/download/v2.1.0/release.tar.gz"
  sha256 "887f3ea173cb32a9467a3b431cd1a85dfd5cbe7b02c98108107205ca7685b50a"
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
