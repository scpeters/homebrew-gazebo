require 'formula'

class Gazebo < Formula
  homepage 'http://gazebosim.org'
  url 'http://bitbucket.org/osrf/gazebo/get/62107b8d4aaa54c4929cd5296da665b25777da13.tar.bz2'
  sha1 'fbd62c2535da115b98e6b4872465c23aa708edaa'
  version '1.6.0'

  depends_on 'boost'
  depends_on 'cmake'  => :build
  depends_on 'doxygen'
  depends_on 'freeimage'
  depends_on 'libtar'
  depends_on 'ogre'
  depends_on 'pkg-config' => :build
  depends_on 'protobuf'
  depends_on 'protobuf-c'
  depends_on 'qt'
  depends_on 'tbb'
  depends_on 'tinyxml'

  depends_on 'bullet' => :optional

  def install
    ENV.m64

    cmake_args = [
      "-DCMAKE_BUILD_TYPE='Release'",
      "-DCMAKE_INSTALL_PREFIX='#{prefix}'",
      "-DCMAKE_FIND_FRAMEWORK=LAST",
      "-Wno-dev"
    ]
    #cmake_args.concat(std_cmake_args)
    cmake_args << ".."

    mkdir "build" do
      system "cmake", *cmake_args
      system "make install"
    end
  end
end
