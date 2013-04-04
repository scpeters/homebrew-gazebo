require 'formula'

class Gazebo < Formula
  homepage 'http://gazebosim.org'
  url 'http://bitbucket.org/osrf/gazebo/get/3a4e13ef0fa8f5fc0f1c480e013abf52c95f8faa.tar.bz2'
  sha1 '70e4fd7176e123f4275e3a9c8ec3aae3ec6f6d40'
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

  depends_on 'bullet' => [:optional, 'shared', 'build-demo']

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
