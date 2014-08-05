require 'formula'

class ArmNoneEabiGcc < Formula
  homepage 'http://gcc.gnu.org/'
  url 'http://ftpmirror.gnu.org/gcc/gcc-4.9.1/gcc-4.9.1.tar.bz2'
  mirror 'ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.1/gcc-4.9.1.tar.bz2'
  sha1 '3f303f403053f0ce79530dae832811ecef91197e'

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
