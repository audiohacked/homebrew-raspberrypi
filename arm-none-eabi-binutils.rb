require "formula"

class ArmNoneEabiBinutils < Formula
  homepage "http://www.gnu.org/software/binutils/"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.24.tar.bz2"
  mirror "http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.bz2"
  sha1 "7ac75404ddb3c4910c7594b51ddfc76d4693debb"

  def install
    target = "arm-none-eabi"
    system "./configure", "--target=#{target}",
                          "--prefix=#{prefix}",
                          "--infodir=#{info}",
                          "--mandir=#{man}",
                          "--disable-nls",
                          "--disable-werror"
    system "make"
    system "make install"
  end

end
