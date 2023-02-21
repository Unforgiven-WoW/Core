# Environment Setup

## Build boost
```bash
# Visual Studio 2019 bootstrap
./bootstrap vc142

# Visual Studio 2019 - 32bit Build 
./b2 --build-dir=build/x86 address-model=32 threading=multi --build-type=complete --stagedir=./stage/x86 --toolset=msvc-14.2 -j 12  

# Visual Studio 2019 - 64bit Build
./b2 --build-dir=build/x64 address-model=64 threading=multi --build-type=complete --stagedir=./stage/x64 --toolset=msvc-14.2 -j 12  

# Visual Studio 2017 - 32bit Build 
./b2 --build-dir=build/x86 address-model=32 threading=multi --build-type=complete --stagedir=./stage/x86 --toolset=msvc-14.1 -j 12  

# Visual Studio 2017 - 64bit Build
./b2 --build-dir=build/x64 address-model=64 threading=multi --build-type=complete --stagedir=./stage/x64 --toolset=msvc-14.1 -j 12  

# Visual Studio 2015 - 32bit Build 
./b2 --build-dir=build/x86 address-model=32 threading=multi --build-type=complete --stagedir=./stage/x86 --toolset=msvc-14.0 -j 12  

# Visual Studio 2015 - 64bit Build
./b2 --build-dir=build/x64 address-model=64 threading=multi --build-type=complete --stagedir=./stage/x64 --toolset=msvc-14.0 -j 12  
```