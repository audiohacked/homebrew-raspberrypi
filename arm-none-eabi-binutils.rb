require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ArmNoneEabiBinutils < Formula
  homepage "http://www.gnu.org/software/binutils/"
  url "http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.bz2"
  sha1 "7ac75404ddb3c4910c7594b51ddfc76d4693debb"

  # depends_on "cmake" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    target = "arm-none-eabi"
    # Remove unrecognized options if warned by configure
    system "./configure", "--target=#{target}",
                          "--prefix=#{prefix}",
                          "--infodir=#{info}",
                          "--mandir=#{man}",
                          "--disable-nls",
                          "--disable-werror"
    # system "cmake", ".", *std_cmake_args
    system "make"
    system "make install" # if this fails, try separate make/make install steps
  end

end
