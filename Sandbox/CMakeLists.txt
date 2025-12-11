project(Sandbox LANGUAGES CXX)

file(GLOB_RECURSE SANDBOX_SRC CONFIGURE_DEPENDS "src/*.cpp" "src/*.h")

add_executable(Sandbox ${SANDBOX_SRC})

# Link engine DLL
target_link_libraries(Sandbox PRIVATE HexEngine)

# Include engine headers
target_include_directories(Sandbox PUBLIC
    ${CMAKE_SOURCE_DIR}/HexEngine/src
)

target_compile_definitions(Sandbox
    PRIVATE
        HX_PLATFORM_WINDOWS
        _SILENCE_ALL_MS_EXT_DEPRECATION_WARNINGS
)

# Output folders matching Premake layout
set_target_properties(Sandbox PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY_DEBUG   ${CMAKE_BINARY_DIR}/bin/Debug-Windows-x86_64/Sandbox
    RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/bin/Release-Windows-x86_64/Sandbox
    RUNTIME_OUTPUT_DIRECTORY_DIST    ${CMAKE_BINARY_DIR}/bin/Dist-Windows-x86_64/Sandbox
)
