set -e

# ENV_ARGS="CC=/usr/bin/gcc-8 CXX=/usr/bin/g++-8"
apt install -y libcurl4-openssl-dev libcurlpp-dev libpugixml-dev nlohmann-json3-dev libinih-dev

eval $ENV_ARGS cmake -B ./build -DCMAKE_BUILD_TYPE=Release -G Ninja -DCMAKE_INSTALL_LIBDIR=$PWD/miniocpp-sdk/release --install-prefix $PWD/miniocpp-sdk/release # -DCMAKE_TOOLCHAIN_FILE=./vcpkg-master/scripts/buildsystems/vcpkg.cmake -DCMAKE_CXX_LINKER_FLAGS_INIT=-lstdc++fs 
cmake --build ./build --config Release -j
cmake --install build/

eval $ENV_ARGS cmake -B ./build -DCMAKE_BUILD_TYPE=Debug -G Ninja -DCMAKE_INSTALL_LIBDIR=$PWD/miniocpp-sdk/debug --install-prefix $PWD/miniocpp-sdk/debug # -DCMAKE_TOOLCHAIN_FILE=./vcpkg-master/scripts/buildsystems/vcpkg.cmake
cmake --build ./build --config Debug -j
cmake --install build/ 

tar -zcvf miniocpp-sdk.tar.gz miniocpp-sdk