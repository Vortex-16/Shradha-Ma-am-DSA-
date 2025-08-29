@echo off
title Testing All DSA Programs
color 0E
cls

echo ===============================================
echo          TESTING ALL DSA PROGRAMS
echo ===============================================
echo.

:: Test main directory
echo ✅ Testing main directory programs...
cd /d "%~dp0"

echo   Testing PatternAdvanceMenu...
echo 10 | java PatternAdvanceMenu >nul 2>&1
if %errorlevel% equ 0 (
    echo   ✅ PatternAdvanceMenu works
) else (
    echo   ❌ PatternAdvanceMenu failed
)

echo   Testing SortingMenu...
echo 8 | java SortingMenu >nul 2>&1
if %errorlevel% equ 0 (
    echo   ✅ SortingMenu works
) else (
    echo   ❌ SortingMenu failed
)

echo.
echo ✅ Testing executables directory...
cd executables

echo   Testing PatternAdvanceMenu in executables...
echo 10 | java PatternAdvanceMenu >nul 2>&1
if %errorlevel% equ 0 (
    echo   ✅ PatternAdvanceMenu (executables) works
) else (
    echo   ❌ PatternAdvanceMenu (executables) failed
)

echo   Testing SortingMenu in executables...
echo 8 | java SortingMenu >nul 2>&1
if %errorlevel% equ 0 (
    echo   ✅ SortingMenu (executables) works
) else (
    echo   ❌ SortingMenu (executables) failed
)

cd ..

echo.
echo ===============================================
echo ✅ ALL TESTS COMPLETED!
echo ===============================================
echo.
echo 🚀 Ready to use:
echo   • DSA-Complete-Hub.bat (Main launcher)
echo   • executables\DSA-Programs.bat (Alternative)
echo   • Individual .bat files in executables\
echo.
echo 🔗 Repository: https://github.com/TanushTiwari/Java
echo.
pause
