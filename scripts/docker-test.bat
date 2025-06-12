@echo off
REM Script to run Playwright tests in Docker with proper user permissions on Windows
REM This script sets default USER_ID and GROUP_ID for Windows compatibility

setlocal

REM Set default user and group IDs for Windows
set USER_ID=1000
set GROUP_ID=1000

REM Parse command line argument
set COMMAND=%1
if "%COMMAND%"=="" set COMMAND=test

if "%COMMAND%"=="test" goto :test
if "%COMMAND%"=="test-ui" goto :test-ui
if "%COMMAND%"=="build" goto :build
if "%COMMAND%"=="clean" goto :clean
if "%COMMAND%"=="help" goto :help
if "%COMMAND%"=="-h" goto :help
if "%COMMAND%"=="--help" goto :help

echo Error: Unknown command '%COMMAND%'
echo.
goto :help

:test
echo Running Playwright tests in Docker...
docker compose -f docker-compose.playwright.yml run --rm playwright
goto :end

:test-ui
echo Running Playwright tests with UI in Docker...
echo Open http://localhost:9323 in your browser
docker compose -f docker-compose.playwright.yml up playwright-ui
goto :end

:build
echo Building Playwright Docker image...
docker compose -f docker-compose.playwright.yml build
goto :end

:clean
echo Cleaning test results and reports...
docker compose -f docker-compose.playwright.yml run --rm playwright sh -c "rm -rf test-results/ playwright-report/"
echo Clean completed.
goto :end

:help
echo Usage: %0 [command]
echo.
echo Commands:
echo   test        Run Playwright tests (default)
echo   test-ui     Run Playwright tests with UI
echo   build       Build Docker image
echo   clean       Clean test results and reports
echo   help        Show this help message
echo.
echo Examples:
echo   %0 test       # Run tests
echo   %0 test-ui    # Run tests with UI
echo   %0 clean      # Clean up test artifacts
goto :end

:end
endlocal