---
layout: post
title: Install opencv on MacOS(arm64)
tags: MacOS  Xcode  opencv 
---
# Install opencv on MacOS(arm64)

## Environment
Xcode 15.1
Build version 15C65

xcode-select version 2397

Python 3.9.6

swift-driver version: 1.87.3 Apple Swift version 5.9.2 (swiftlang-5.9.2.2.56 clang-1500.1.0.2.5)
Target: arm64-apple-macosx13.0

## Steps
### Install Cmake
1. Get Cmake v3.24.2 package
```
mkdir ~/Downloads/CMake
curl --silent --location --retry 3 "https://github.com/Kitware/CMake/releases/download/v3.24.2/cmake-3.24.2-macos-universal.dmg" --output ~/Downloads/CMake/cmake-macos.dmg
```
2. Mount the image
```
yes | PAGER=cat hdiutil attach -quiet -mountpoint /Volumes/cmake-macos ~/Downloads/CMake/cmake-macos.dmg
```
3. a. If you have root privilege
```
cp -R /Volumes/cmake-macos/CMake.app /Applications/
sudo "/Applications/CMake.app/Contents/bin/cmake-gui" --install=/usr/local/bin
```
b. If you don't have root privilege
just add your path of CMake under mounted folder to ${PATH}
```
PATH=${PATH}:/Volumes/cmake-macos/CMake.app/Contents/bin/
```
4. Open a new terminal window and check
```
cmake --version
```

### Install OpenCV
1. Get OpenCV 4.6.0 repo
```
git clone https://github.com/opencv/opencv.git -b 4.6.0
```
Extra modules
```
git clone https://github.com/opencv/opencv_contrib.git -b 4.6.0
```

2. Solve upcoming compilation problem in advance by editing
opencv/modules/objc/generator/templates/cmakelists.template
```
vim opencv/modules/objc/generator/templates/cmakelists.template
```
add following line of code to the file
```
set (CMAKE_Swift_COMPILER "/usr/bin/swiftc")
```
3. If you don't have root privilege and can't use "python" command,
use below commands to bulk change python files to set  "python3" as default invoker
```
grep -rn "\#\!\/usr\/bin\/env\ python"|grep -v python3|awk -F':' '{print $1}'|xargs -I@ sed -i '' 's/\#\!\/usr\/bin\/env\ python/\#\!\/usr\/bin\/env\ python3/g' @
```
4. Start building... It will take some minutes 
```
python3 opencv/platforms/apple/build_xcframework.py --out opencv-build --contrib opencv_contrib --iphoneos_archs arm64 --iphonesimulator_archs arm64 --iphoneos_deployment_target=17.2 --build_only_specified_archs
```
5. Have fun and enjoy it