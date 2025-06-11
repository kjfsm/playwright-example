#!/bin/bash

# Script to run Playwright tests in Docker with proper user permissions
# This script automatically sets USER_ID and GROUP_ID to match the current user

set -e

# Get current user and group IDs
if command -v id >/dev/null 2>&1; then
    USER_ID=$(id -u)
    GROUP_ID=$(id -g)
else
    # Fallback for systems without id command
    USER_ID=1000
    GROUP_ID=1000
    echo "Warning: 'id' command not found. Using default USER_ID=1000 GROUP_ID=1000"
fi

export USER_ID
export GROUP_ID

# Function to show usage
usage() {
    echo "Usage: $0 [command]"
    echo ""
    echo "Commands:"
    echo "  test        Run Playwright tests (default)"
    echo "  test-ui     Run Playwright tests with UI"
    echo "  build       Build Docker image"
    echo "  clean       Clean test results and reports"
    echo "  help        Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 test       # Run tests"
    echo "  $0 test-ui    # Run tests with UI"
    echo "  $0 clean      # Clean up test artifacts"
}

# Parse command
COMMAND=${1:-test}

case $COMMAND in
    "test")
        echo "Running Playwright tests in Docker..."
        docker compose -f docker-compose.playwright.yml run --rm playwright
        ;;
    "test-ui")
        echo "Running Playwright tests with UI in Docker..."
        echo "Open http://localhost:9323 in your browser"
        docker compose -f docker-compose.playwright.yml up playwright-ui
        ;;
    "build")
        echo "Building Playwright Docker image..."
        docker compose -f docker-compose.playwright.yml build
        ;;
    "clean")
        echo "Cleaning test results and reports..."
        docker compose -f docker-compose.playwright.yml run --rm playwright sh -c 'rm -rf test-results/ playwright-report/'
        echo "Clean completed."
        ;;
    "help"|"-h"|"--help")
        usage
        ;;
    *)
        echo "Error: Unknown command '$COMMAND'"
        echo ""
        usage
        exit 1
        ;;
esac