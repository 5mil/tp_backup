# Windows Port Source Files

This directory contains Windows-specific source code for the Twilight Princess port.

## Current Files

### win_main.cpp
The main entry point for the Windows port. Contains:
- `WinMain()` - Windows GUI application entry point
- `main()` - Console application entry point
- Stub functions for future game integration

## Architecture

The Windows port follows a layered architecture:

```
┌─────────────────────────────────────┐
│      Game Logic (from src/)         │  ← Shared game code
├─────────────────────────────────────┤
│    Platform Abstraction Layer       │  ← To be implemented
├─────────────────────────────────────┤
│   Windows-Specific Implementation   │  ← This directory
│  (Graphics, Audio, Input, etc.)     │
├─────────────────────────────────────┤
│        Windows API / SDL2           │  ← System layer
└─────────────────────────────────────┘
```

## Future Structure

As the port develops, this directory will expand to include:

```
src/windows/
├── win_main.cpp           # Main entry point
├── win_graphics.cpp       # OpenGL/DirectX graphics backend
├── win_audio.cpp          # Audio system (SDL2/XAudio2)
├── win_input.cpp          # Keyboard/gamepad input
├── win_file.cpp           # File I/O
├── platform/              # Platform abstraction
│   ├── graphics.h         # Graphics interface
│   ├── audio.h            # Audio interface
│   └── input.h            # Input interface
└── utils/                 # Windows utilities
    ├── debug.cpp          # Debug output
    └── timer.cpp          # Timing functions
```

## Design Principles

1. **Minimal Changes to Game Code**: The original game logic should remain largely unchanged
2. **Platform Abstraction**: Use interfaces to separate game code from Windows-specific implementation
3. **Modern Standards**: Use C++17 features and modern Windows APIs
4. **Cross-Platform Ready**: Design with potential Linux/macOS ports in mind

## Dependencies

Currently minimal:
- Windows SDK (included with MinGW-w64)
- Standard C++ library

Future dependencies:
- SDL2 (graphics, input, audio)
- OpenGL (rendering)
- Optional: ImGui (debug UI)

## Implementation Notes

### Graphics
The GameCube/Wii use the GX graphics API. For Windows, we need to:
- Translate GX commands to OpenGL or DirectX
- Implement vertex buffer management
- Handle texture loading and management
- Support the fixed-function pipeline features used by the original

### Audio
Original uses GameCube/Wii audio hardware. Windows port will use:
- SDL2_mixer or similar for sound effects
- Custom streaming for music
- 3D audio positioning

### Input
- Map GameCube controller to keyboard/Xbox controller
- Support multiple input methods
- Maintain original button mapping semantics

### File System
- Convert GameCube DVD filesystem paths to Windows paths
- Handle case sensitivity differences
- Support loading from extracted game files

## Building

See the main project documentation:
- [Windows Port Quick Start](../../docs/WINDOWS_QUICKSTART.md)
- [Windows Port Documentation](../../docs/WINDOWS_PORT.md)

## Contributing

When adding files to this directory:
1. Keep Windows-specific code isolated
2. Use platform abstraction interfaces
3. Document any GameCube/Wii API replacements
4. Add corresponding header files
5. Update CMakeLists.txt and Makefile.windows

## License

Same as the main project - see LICENSE.md in the repository root.
