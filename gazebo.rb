require 'formula'

class Gazebo < Formula
  homepage 'http://gazebosim.org'
  url 'http://gazebosim.org/assets/distributions/gazebo-1.5.0.tar.bz2'
  sha1 'f1b538e042a921cf58d06279b18a35d4e3ea8806'

  depends_on 'boost'
  depends_on 'cmake'  => :build
  depends_on 'doxygen'
  depends_on 'freeimage'
  depends_on 'libtar'
  depends_on 'ogre'
  depends_on 'protobuf'
  depends_on 'protobuf-c'
  depends_on 'qt'
  depends_on 'tbb'
  depends_on 'tinyxml'

  depends_on 'bullet' => :optional

  def install
    ENV.m64

    cmake_args = [
      "-DCMAKE_RELEASE_TYPE='Release'"
    ]

    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make install"
    end
  end
end
