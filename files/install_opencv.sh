#!/bin/zsh
ABS_PATH=$(cd "$(dirname "$1")"; pwd)

funciton install_cmake(){
  mkdir ~/Downloads/CMake
  curl --silent --location --retry 3 "https://github.com/Kitware/CMake/releases/download/v3.24.2/cmake-3.24.2-macos-universal.dmg" --output ~/Downloads/CMake/cmake-macos.dmg
  yes | PAGER=cat hdiutil attach -quiet -mountpoint /Volumes/cmake-macos ~/Downloads/CMake/cmake-macos.dmg
  PATH=${PATH}:/Volumes/cmake-macos/CMake.app/Contents/bin/
  cmake --version
}
function install_opencv(){
  test -d opencv || git clone https://github.com/opencv/opencv.git -b 4.6.0
  test -d opencv_contrib || git clone https://github.com/opencv/opencv_contrib.git -b 4.6.0
  cat opencv/modules/objc/generator/templates/cmakelists.template|grep -q "CMAKE_Swift_COMPILER" || sed -i '' '14i\
set (CMAKE_Swift_COMPILER "/usr/bin/swiftc")' opencv/modules/objc/generator/templates/cmakelists.template
  grep -rn "\#\!\/usr\/bin\/env\ python"|grep -v python3|awk -F':' '{print $1}'|xargs -I@ sed -i '' 's/\#\!\/usr\/bin\/env\ python/\#\!\/usr\/bin\/env\ python3/g' @
  python3 opencv/platforms/apple/build_xcframework.py --out opencv-build --contrib opencv_contrib --iphoneos_archs arm64 --iphonesimulator_archs arm64 --iphoneos_deployment_target=17.2 --build_only_specified_archs
}
function main() {
  install_cmake
  install_opencv

}
main
