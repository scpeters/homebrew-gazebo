require 'formula'

class Gazebo < Formula
  homepage 'http://gazebosim.org'
  url 'http://bitbucket.org/osrf/gazebo/get/c5068dbf21ee9fe9cba6090cba9f31683b7015b6.tar.bz2'
  sha1 '402c39a3f3044de73faba7e713f12514ccca01fc'

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
      "-DCMAKE_INSTALL_PREFIX=/usr/local/Cellar/gazebo/1.5.0",
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
