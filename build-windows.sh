#!/bin/bash
# Build verification script for Windows port
# This script verifies that the Windows port can be built successfully

set -e  # Exit on error

echo "================================================"
echo "Twilight Princess - Windows Port Build Test"
echo "================================================"
echo ""

# Check for required tools
echo "Checking build tools..."
command -v x86_64-w64-mingw32-g++ >/dev/null 2>&1 || {
    echo "ERROR: MinGW-w64 not found!"
    echo "Install with: sudo apt-get install mingw-w64"
    exit 1
}
echo "✓ MinGW-w64 found"

command -v make >/dev/null 2>&1 || {
    echo "ERROR: make not found!"
    exit 1
}
echo "✓ make found"

command -v cmake >/dev/null 2>&1 || {
    echo "ERROR: cmake not found!"
    exit 1
}
echo "✓ cmake found"
echo ""

# Clean previous builds
echo "Cleaning previous builds..."
rm -rf build/windows build/cmake-windows
echo "✓ Clean complete"
echo ""

# Build with Make
echo "================================================"
echo "Building with Make..."
echo "================================================"
make -f Makefile.windows CROSS=x86_64-w64-mingw32-
if [ -f "build/windows/bin/TwilightPrincess.exe" ]; then
    SIZE=$(ls -lh build/windows/bin/TwilightPrincess.exe | awk '{print $5}')
    echo "✓ Make build successful! (Size: $SIZE)"
    file build/windows/bin/TwilightPrincess.exe
else
    echo "✗ Make build failed!"
    exit 1
fi
echo ""

# Build with CMake
echo "================================================"
echo "Building with CMake..."
echo "================================================"
cmake -B build/cmake-windows -S . \
    -DCMAKE_SYSTEM_NAME=Windows \
    -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc \
    -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++

cmake --build build/cmake-windows

if [ -f "build/cmake-windows/bin/TwilightPrincess.exe" ]; then
    SIZE=$(ls -lh build/cmake-windows/bin/TwilightPrincess.exe | awk '{print $5}')
    echo "✓ CMake build successful! (Size: $SIZE)"
    file build/cmake-windows/bin/TwilightPrincess.exe
else
    echo "✗ CMake build failed!"
    exit 1
fi
echo ""

# Summary
echo "================================================"
echo "Build Verification Summary"
echo "================================================"
echo "✓ All builds completed successfully!"
echo ""
echo "Executables created:"
echo "  - build/windows/bin/TwilightPrincess.exe (Make)"
echo "  - build/cmake-windows/bin/TwilightPrincess.exe (CMake)"
echo ""
echo "To run on Windows, copy either executable to a Windows machine."
echo "================================================"
