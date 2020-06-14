class NeovimQt < Formula
  desc "Neovim GUI, in Qt5"
  homepage "https://github.com/equalsraf/neovim-qt"
  url "https://github.com/equalsraf/neovim-qt/archive/v0.2.16.tar.gz"
  sha256 "fc1244e0b667688c684e540b6c09aa14a62cc441e4b4e7f742ed61cdf94937d6"
  head "https://github.com/equalsraf/neovim-qt.git"

  depends_on "cmake" => :build
  depends_on "qt"
  depends_on "neovim"

  def install
    mkdir "build" do
      system "cmake", "-DCMAKE_BUILD_TYPE=Release", ".."
      system "make"
      prefix.install "bin/nvim-qt.app"
      bin.install_symlink prefix/"nvim-qt.app/Contents/MacOS/nvim-qt"
    end
  end

  test do
    system bin/"nvim-qt", "--help"
  end
end
