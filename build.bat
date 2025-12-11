@echo off
setlocal

REM ================================
REM Build script for HexEngine + Sandbox
REM Using CMake + Ninja
REM ================================

echo.
echo ================================
echo   HexEngine Build System
echo ================================
echo.

REM Default build type
set BUILD_TYPE=Debug

if not "%1"=="" (
    set BUILD_TYPE=%1
)

echo Building configuration: %BUILD_TYPE%

REM --- Directories ---
set ROOT_DIR=%cd%
set BUILD_DIR=%ROOT_DIR%\build
set BIN_DIR=%BUILD_DIR%\bin
set OUT_DIR=%BIN_DIR%\%BUILD_TYPE%-Windows-x86_64

REM --- Engine + Sandbox target output dirs ---
set ENGINE_DLL=%OUT_DIR%\HexEngine\HexEngine.dll
set SANDBOX_DIR=%OUT_DIR%\Sandbox

echo.
echo Configuring CMake...
cmake -S . -B "%BUILD_DIR%" -G Ninja -DCMAKE_BUILD_TYPE=%BUILD_TYPE%
if %errorlevel% neq 0 goto :cmake_fail

echo.
echo Building...
cmake --build "%BUILD_DIR%" --config %BUILD_TYPE%
if %errorlevel% neq 0 goto :build_fail

echo.
echo Copying DLL to Sandbox...
if not exist "%SANDBOX_DIR%" mkdir "%SANDBOX_DIR%"
copy /Y "%ENGINE_DLL%" "%SANDBOX_DIR%"
if %errorlevel% neq 0 goto :copy_fail

echo.
echo ================================
echo Build Complete!
echo DLL copied to Sandbox.
echo ================================
goto :done

REM -------------------
REM ERROR HANDLERS
REM -------------------
:cmake_fail
echo [ERROR] CMake configuration failed!
goto :done

:build_fail
echo [ERROR] Build failed!
goto :done

:copy_fail
echo [ERROR] Failed to copy HexEngine.dll into Sandbox!
goto :done

:done
echo.
pause
