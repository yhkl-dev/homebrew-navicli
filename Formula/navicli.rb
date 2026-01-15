class Navicli < Formula
  desc "A lightweight command line music player for Navidrome"
  homepage "https://github.com/yhkl-dev/NaviCLI"
  url "https://github.com/yhkl-dev/NaviCLI/releases/download/v1.0.5/release.tar.gz"
  sha256 "3bea982490aeb77d13a22b9510b4a37fab2ac1756579727cc037e24ab5a9b32c"
  license "MIT"

  depends_on "go" => :build
  depends_on "mpv"

  def install
    # 如果 release.tar.gz 中已经有编译好的二进制，直接安装
    if File.exist?("navicli")
      bin.install "navicli"
    else
      # 否则从源代码编译
      system "go", "build", "-o", "navicli", "."
      bin.install "navicli"
    end
  end

  test do
    # 测试二进制文件是否存在
    assert_predicate bin/"navicli", :exist?
  end
end
