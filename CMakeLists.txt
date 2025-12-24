cmake_minimum_required(VERSION 3.15)
project(TwilightPrincess_Windows)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Configuration
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Compiler flags
if(MSVC)
    add_compile_options(/W4)
else()
    # MinGW or GCC
    add_compile_options(-Wall -Wextra)
endif()

# Define the executable
add_executable(tp_windows
    src/windows/win_main.cpp
)

# Windows-specific libraries
if(WIN32)
    target_link_libraries(tp_windows
        kernel32
        user32
        gdi32
    )
endif()

# Set output name
set_target_properties(tp_windows PROPERTIES
    OUTPUT_NAME "TwilightPrincess"
)

# Install target
install(TARGETS tp_windows
    RUNTIME DESTINATION bin
)

# Print configuration info
message(STATUS "Building Twilight Princess Windows Port")
message(STATUS "C++ Compiler: ${CMAKE_CXX_COMPILER}")
message(STATUS "Build Type: ${CMAKE_BUILD_TYPE}")
