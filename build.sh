set -e

ENV_ARGS="CC=/usr/bin/gcc-8 CXX=/usr/bin/g++-8"
apt install -y libcurl4-openssl-dev libcurlpp-dev

eval $ENV_ARGS cmake -B ./build -DCMAKE_BUILD_TYPE=Release -G Ninja -DCMAKE_INSTALL_LIBDIR=$PWD/miniocpp-sdk/release --install-prefix $PWD/miniocpp-sdk/release -DCMAKE_TOOLCHAIN_FILE=./vcpkg-master/scripts/buildsystems/vcpkg.cmake -DCMAKE_CXX_LINKER_FLAGS_INIT=-lstdc++fs 
cmake --build ./build --config Release -j4
cmake --install build/
cp -r build/vcpkg_installed/arm64-linux/include $PWD/miniocpp-sdk/release
cp -r build/vcpkg_installed/arm64-linux/lib $PWD/miniocpp-sdk/release
cp -r build/vcpkg_installed/arm64-linux/share $PWD/miniocpp-sdk


eval $ENV_ARGS cmake -B ./build -DCMAKE_BUILD_TYPE=Debug -G Ninja -DCMAKE_INSTALL_LIBDIR=$PWD/miniocpp-sdk/debug --install-prefix $PWD/miniocpp-sdk/debug -DCMAKE_TOOLCHAIN_FILE=./vcpkg-master/scripts/buildsystems/vcpkg.cmake
cmake --build ./build --config Debug -j4
cmake --install build/ 

cp -r build/vcpkg_installed/arm64-linux/include $PWD/miniocpp-sdk/debug
cp -r build/vcpkg_installed/arm64-linux/debug/lib $PWD/miniocpp-sdk/debug

tar -zcvf miniocpp-sdk.tar.gz miniocpp-sdk