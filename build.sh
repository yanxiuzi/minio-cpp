cmake -B ./build -DCMAKE_BUILD_TYPE=Release --install-prefix $PWD/miniocpp-sdk/release #-DCMAKE_TOOLCHAIN_FILE=/home/zhangxianfu/Code/vcpkg/scripts/buildsystems/vcpkg.cmake 
cmake --build ./build --config Release -j
cmake --install build/

cmake -B ./build -DCMAKE_BUILD_TYPE=Debug -G Ninja --install-prefix $PWD/miniocpp-sdk/debug # -DCMAKE_TOOLCHAIN_FILE=/home/zhangxianfu/Code/vcpkg/scripts/buildsystems/vcpkg.cmake 
cmake --build ./build --config Debug -j
cmake --install build/ 


tar -zcvf miniocpp-sdk.tar.gz miniocpp-sdk