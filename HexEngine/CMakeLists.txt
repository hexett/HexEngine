project(HexEngine LANGUAGES CXX)

file(GLOB_RECURSE ENGINE_SRC CONFIGURE_DEPENDS "src/*.cpp" "src/*.h")

add_library(HexEngine SHARED ${ENGINE_SRC})

target_include_directories(HexEngine PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

CPMAddPackage(
    NAME spdlog
    VERSION 1.12.0
    GITHUB_REPOSITORY gabime/spdlog
)
target_link_libraries(HexEngine PUBLIC spdlog::spdlog)



target_compile_definitions(HexEngine 
    PRIVATE 
        HX_PLATFORM_WINDOWS
        HX_BUILD_DLL
        _SILENCE_ALL_MS_EXT_DEPRECATION_WARNINGS
)

# ---------------------------------------------------------
# Output folder
# bin/Debug-Windows-x86_64/HexEngine/HexEngine.dll
# ---------------------------------------------------------
set_target_properties(HexEngine PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY_DEBUG   ${CMAKE_BINARY_DIR}/bin/Debug-Windows-x86_64/HexEngine
    RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/bin/Release-Windows-x86_64/HexEngine
    RUNTIME_OUTPUT_DIRECTORY_DIST    ${CMAKE_BINARY_DIR}/bin/Dist-Windows-x86_64/HexEngine
)

# ---------------------------------------------------------
# Copy DLL to Sandbox automatically
# ---------------------------------------------------------
foreach(CONFIG Debug Release Dist)
    add_custom_command(TARGET HexEngine POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory
        ${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}-${CMAKE_SYSTEM_NAME}-${CMAKE_SYSTEM_PROCESSOR}/Sandbox/

    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        $<TARGET_FILE:HexEngine>
        ${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}-${CMAKE_SYSTEM_NAME}-${CMAKE_SYSTEM_PROCESSOR}/Sandbox/

    COMMENT "Copying HexEngine.dll to Sandbox output directory..."
    )
endforeach()
