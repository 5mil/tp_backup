# Windows Port Quick Start

This guide will help you quickly build the Windows executable for Twilight Princess.

## Quick Build (Cross-compilation from Linux)

```bash
# Install MinGW-w64
sudo apt-get install mingw-w64  # Ubuntu/Debian

# Build the executable
make -f Makefile.windows CROSS=x86_64-w64-mingw32-

# Output will be at: build/windows/bin/TwilightPrincess.exe
```

## What You Get

Currently, the Windows port produces a minimal executable that:
- Opens a console window
- Displays initialization messages
- Demonstrates the basic structure for a Windows game port

This is a **proof-of-concept** showing that the game code can be cross-compiled to Windows.

## What's Next

The current executable is a foundation for future development. To make the game fully functional, these components need to be added:

1. **Graphics Backend**: SDL2 + OpenGL to replace GameCube GX API
2. **Input System**: Keyboard and gamepad support
3. **Audio System**: Replace GameCube audio with SDL2 or similar
4. **Asset Loading**: PC-compatible file I/O for game assets
5. **Game Engine Integration**: Connect the existing game code to the PC platform layer

## For Developers

See [`docs/WINDOWS_PORT.md`](WINDOWS_PORT.md) for detailed information including:
- Full build instructions
- Architecture overview
- Development roadmap
- How to contribute

## Running the Executable

On a Windows machine, simply run:
```
TwilightPrincess.exe
```

The current version will show a console message and wait for user input.

## Important Notes

⚠️ This is **experimental** and separate from the main GameCube/Wii decompilation project.

⚠️ The game is **not yet playable** - this is just the initial framework.

⚠️ Requires original game assets (not included).
