# PInvoke example for the GHI Electronics Endpoint devices

## Prerequisites

### Build system

Install cmake and ninja.  CMake is a build-system builder, and ninja is a build program analogous to msbuild, make, nmake, etc., only much faster and consistent across platforms. CMake and Ninja allow us to build this project on Mac, Windows, or Linux.

### Toolchain

A 'toolchain' is a set of programs that will run on your host machine (the machine that you are using to write your programs) while targetting a completely different type of system.  In this case, we are using a Mac, Windows, or Linux system to build files for a Linux-based, ARM processor with 'hard float' capabilities.

To build this example on windows:
1. Install MSVC (it comes with Visual Studio or the C++ tools for VSCode)
1. Install the ARM toolchain from [this page](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads). Download and install [arm-gnu-toolchain-13.2.rel1-mingw-w64-i686-arm-none-linux-gnueabihf.exe](https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-mingw-w64-i686-arm-none-linux-gnueabihf.exe?rev=c721fbf7e0ed48f0a5f0250740400f7c&hash=6733718EFDDFED56698E38E54EDFC268).

To build this example on Linux or Mac, to to that same download page and find the section for your 'host' operating system and install the arm-none-linux-gnueabihf binaries that run on your system. I have not tried all of the variations, so I can't offer more help here at the moment.

## Running the example

### On your Windows desktop

1. Open a command window on your host machine (Windows machine)
1. cd into the endpoint-examples/src/pinvoke directory
1. Run: ```build windows```.  This will build the native library and the dotnet program and run the program.

### On an Endpoint device

1. Open a command window on your host machine (Windows machine)
1. cd into the endpoint-examples/src/pinvoke directory
1. Run ```build endpoint```.
1. Use VSCode and the Endpoint Debugger extension to install and run the application on the Endpoint.