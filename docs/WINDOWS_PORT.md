# Windows Port

This directory contains an experimental Windows port of The Legend of Zelda: Twilight Princess.

## Overview

The Windows port is an **early-stage experimental effort** to compile the decompiled game code into a native Windows executable (.exe). This is separate from the original GameCube/Wii build system and serves as a proof-of-concept for running the game on PC.

⚠️ **Current Status**: This is a minimal implementation with just a basic entry point. The game is not yet playable.

## Important Notes

- This port requires the game assets from an original copy of the game
- This is NOT an emulator - it's a recompilation of the game code for Windows
- Currently only provides a basic executable shell; full game functionality is under development
- This is an experimental feature and not part of the official decompilation project goals

## Building

### Prerequisites

#### On Windows (Native)
- CMake 3.15 or higher
- Visual Studio 2019+ OR MinGW-w64
- Git

#### On Linux/macOS (Cross-compilation)
- CMake 3.15 or higher
- MinGW-w64 cross-compiler
- Git

### Build Methods

#### Method 1: CMake (Recommended)

**On Windows:**
```bash
# Configure
cmake -B build/windows -S .

# Build
cmake --build build/windows

# The executable will be in build/windows/bin/TwilightPrincess.exe
```

**Cross-compiling from Linux:**
```bash
# Install MinGW-w64
sudo apt-get install mingw-w64  # Ubuntu/Debian
sudo dnf install mingw64-gcc mingw64-gcc-c++  # Fedora

# Configure for cross-compilation
cmake -B build/windows -S . \
    -DCMAKE_SYSTEM_NAME=Windows \
    -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc \
    -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++

# Build
cmake --build build/windows

# The executable will be in build/windows/bin/TwilightPrincess.exe
```

#### Method 2: Makefile

**On Windows (MinGW):**
```bash
make -f Makefile.windows
```

**Cross-compiling from Linux:**
```bash
# For 64-bit Windows
make -f Makefile.windows windows-x64

# For 32-bit Windows
make -f Makefile.windows windows-x86

# Or manually specify the cross-compiler
make -f Makefile.windows CROSS=x86_64-w64-mingw32-
```

## Running

On Windows, simply run the generated executable:
```bash
./build/windows/bin/TwilightPrincess.exe
```

Or using the Makefile:
```bash
make -f Makefile.windows run
```

Currently, the executable will:
1. Open a console window
2. Display initialization messages
3. Wait for user input before exiting

## Project Structure

```
src/windows/
  win_main.cpp          - Windows entry point

CMakeLists.txt          - CMake build configuration
Makefile.windows        - Alternative Makefile for Windows builds
docs/WINDOWS_PORT.md    - This file
```

## Development Roadmap

- [x] Basic Windows entry point
- [x] Build system setup (CMake + Makefile)
- [x] Cross-compilation support
- [ ] SDL2 integration for graphics
- [ ] OpenGL rendering backend
- [ ] Input system (keyboard/gamepad)
- [ ] Audio system
- [ ] File I/O abstraction
- [ ] Game engine integration
- [ ] Asset loading
- [ ] Full game functionality

## Technical Details

### Architecture

The Windows port aims to:
1. Replace GameCube/Wii-specific APIs with PC equivalents
2. Use SDL2 for windowing, input, and audio
3. Use OpenGL for rendering (translating GX commands)
4. Maintain the same game logic as the original

### Approach

This is NOT a simple recompilation. Key challenges include:
- The original code uses PowerPC assembly and GameCube/Wii-specific APIs
- Graphics code uses the GX (GameCube graphics) API, which needs translation to OpenGL/DirectX
- Audio uses GameCube-specific sound libraries
- Input needs to be remapped from GameCube controllers to keyboard/gamepad
- Many low-level system calls need PC equivalents

### Current Implementation

The current implementation provides:
- A basic Windows entry point (`WinMain` and `main`)
- Console output for debugging
- A message loop structure
- Stub functions for future game integration

## Contributing

If you want to contribute to the Windows port:

1. Focus on platform abstraction layers
2. Document any GameCube/Wii APIs that need PC equivalents
3. Test cross-compilation regularly
4. Keep changes minimal and well-documented
5. Remember this is experimental - coordinate with the main project team

## Differences from Original Project

The main Twilight Princess decompilation project aims to:
- Produce byte-for-byte identical binaries to the original GameCube/Wii versions
- Use the original PowerPC compilers (Metrowerks CodeWarrior)
- Target GameCube/Wii hardware

This Windows port:
- Targets x86/x64 PC hardware
- Uses modern compilers (GCC/MSVC)
- Modifies code for PC compatibility
- Is NOT intended to match original binaries

## License

This follows the same license as the main project. See LICENSE.md in the root directory.

## Support

For questions about the Windows port:
- Check the main project's Discord (see README.md)
- Open an issue on GitHub with the `windows-port` label

For building the original GameCube/Wii version, see the main README.md.
