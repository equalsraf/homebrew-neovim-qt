class NeovimQt < Formula
  desc "Neovim GUI, in Qt5"
  homepage "https://github.com/equalsraf/neovim-qt"
  url "https://github.com/equalsraf/neovim-qt/archive/v0.2.16.1.tar.gz"
  sha256 "971d4597b40df2756b313afe1996f07915643e8bf10efe416b64cc337e4faf2a"
  head "https://github.com/equalsraf/neovim-qt.git"

  depends_on "cmake" => :build
  depends_on "neovim"
  depends_on "qt@5"

  def install
    mkdir "build" do
      system "cmake", "-DCMAKE_BUILD_TYPE=Release", ".."
      system "make"

      if OS.mac? then
        prefix.install "bin/nvim-qt.app"
        bin.install_symlink prefix/"nvim-qt.app/Contents/MacOS/nvim-qt"
      end

      if OS.linux? then
        bin.install "bin/nvim-qt"
      end
    end
  end

  test do
    system bin/"nvim-qt", "--help"
  end
end
