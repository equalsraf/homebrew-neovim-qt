class NeovimQt < Formula
  desc "Neovim GUI, in Qt5"
  homepage "https://github.com/equalsraf/neovim-qt"
  url "https://github.com/equalsraf/neovim-qt/archive/v0.2.17.tar.gz"
  sha256 "ac538c2e5d63572dd0543c13fafb4d428e67128ea676467fcda68965b2aacda1"
  head "https://github.com/equalsraf/neovim-qt.git"

  depends_on "cmake" => :build
  depends_on "neovim"
  depends_on "qt@5"

  def install
    mkdir "build" do
      system "cmake", "-DCMAKE_BUILD_TYPE=Release", ".."
      system "make"

      if OS.mac?
        prefix.install "bin/nvim-qt.app"
        bin.install_symlink prefix/"nvim-qt.app/Contents/MacOS/nvim-qt"
      end

      if OS.linux?
        bin.install "bin/nvim-qt"
      end
    end
  end

  test do
    system bin/"nvim-qt", "--help"
  end
end
