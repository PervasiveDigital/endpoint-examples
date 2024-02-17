@ECHO OFF
SET target=%1
if "%target%"=="" (
    ECHO "Specify a target - 'windows' or 'endpoint'"
)

SET scriptdir=%~dp0
SET scriptdir=%scriptdir:~0,-1%
SET nativelib=%scriptdir%\nativelib
SET nativelib_build=%nativelib%\build\%target%
SET toolchain_root="C:/Program Files (x86)/Arm GNU Toolchain arm-none-linux-gnueabihf/13.2 Rel1"
if not exist "%nativelib_build%" mkdir %nativelib_build%

if "%target%"=="endpoint" (
    pushd %nativelib%
    cmake -G Ninja -DCMAKE_TOOLCHAIN_FILE=%scriptdir%\cmake\arm-none-linux-gnueabihf.cmake -DTOOLCHAIN_PREFIX=%toolchain_root% -B %nativelib_build% -S %nativelib%
    cmake --build "%nativelib_build%"
    copy "%nativelib_build%\libmathlib.so" %scriptdir%
    dotnet build /p:Configuration=Debug /p:Platform="Any CPU" /property:GenerateFullPaths=true %scriptdir%\pinvoke.csproj
    popd
)

if "%target%"=="windows" (
    pushd %nativelib%
    cmake -G Ninja -B %nativelib_build% -S %nativelib%
    cmake --build "%nativelib_build%"
    copy "%nativelib_build%\mathlib.dll" %scriptdir%
    dotnet build /p:Configuration=Debug /p:Platform="Any CPU" /property:GenerateFullPaths=true /p:DefineConstants=\"WINDOWS_EMULATION\" %scriptdir%\pinvoke.csproj
    "%scriptdir%\bin\Any CPU\Debug\net8.0\pinvoke.exe"
    popd
)
