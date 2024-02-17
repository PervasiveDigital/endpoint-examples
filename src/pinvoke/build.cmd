@ECHO OFF
SET scriptdir=%~dp0
SET scriptdir=%scriptdir:~0,-1%
SET nativelib=%scriptdir%\nativelib
SET nativelib_build=%nativelib%\build
SET toolchain_root="C:/Program Files (x86)/Arm GNU Toolchain arm-none-linux-gnueabihf/13.2 Rel1"
if not exist "%nativelib_build%" mkdir %nativelib_build%

pushd %nativelib%
cmake -G Ninja -DCMAKE_TOOLCHAIN_FILE=%scriptdir%\cmake\arm-none-linux-gnueabihf.cmake -DTOOLCHAIN_PREFIX=%toolchain_root% -B %nativelib_build% -S %nativelib%
cmake build
cd build
ninja
popd
