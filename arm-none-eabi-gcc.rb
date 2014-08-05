require "formula"

class ArmNoneEabiGcc < Formula
  homepage "https://gcc.gnu.org/"
  url "http://ftp.gnu.org/gnu/gcc/gcc-4.8.3/gcc-4.8.3.tar.bz2"
  sha1 "da0a2b9ec074f2bf624a34f3507f812ebb6e4dce"

  # OSX has old libiconv-1.11, maybe add: depends_on 'libiconv'
  depends_on 'gmp'
  depends_on 'libmpc'
  depends_on 'mpfr'
  depends_on 'arm-none-eabi-binutils'

  def install
    target = 'arm-none-eabi'

    args = [
      "--target=#{target}",
      "--prefix=#{prefix}",
      "--infodir=#{info}",
      "--mandir=#{man}",
      "--disable-nls",
      "--enable-languages=c,c++",
      "--without-headers"
    ]

    mkdir 'build' do
      system "../configure", *args
      system "make all-gcc"
      system "make all-target-libgcc"
      ## don't know if this is needed: ENV.deparallelize
      system "make install-gcc"
      system "make install-target-libgcc"
    end
    #info.rmtree
    #man7.rmtree
  end

end
