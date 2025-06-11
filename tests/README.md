# Playwright Testing

This project includes end-to-end tests using Playwright.

## Setup Options

### Option 1: Local Installation

1. Install dependencies:
```bash
npm install
```

2. Install Playwright browsers:
```bash
npx playwright install
```

### Option 2: Docker (Recommended)

Using Docker eliminates the need to install browsers locally and ensures consistent test environments.

1. Install dependencies:
```bash
npm install
```

2. Build the Docker image:
```bash
npm run test:docker:build
```

## Running Tests

### Local Testing

To run all tests:
```bash
npm run test
```

To run tests with UI mode:
```bash
npm run test:ui
```

To run tests in debug mode:
```bash
npm run test:debug
```

### Docker Testing

To run all tests with Docker:
```bash
npm run test:docker
```

To run tests with UI mode using Docker:
```bash
npm run test:docker:ui
```

To clean up test results and reports:
```bash
npm run test:docker:clean
```

#### Cross-platform Helper Scripts

For easier Docker usage, you can use the provided helper scripts:

**Unix/Linux/macOS:**
```bash
./scripts/docker-test.sh test        # Run tests
./scripts/docker-test.sh test-ui     # Run tests with UI
./scripts/docker-test.sh clean       # Clean test artifacts
./scripts/docker-test.sh build       # Build Docker image
```

**Windows:**
```cmd
scripts\docker-test.bat test         # Run tests
scripts\docker-test.bat test-ui      # Run tests with UI
scripts\docker-test.bat clean        # Clean test artifacts
scripts\docker-test.bat build        # Build Docker image
```

The UI will be available at `http://localhost:9323` when using Docker.

#### Permission Handling

The Docker setup automatically handles file permissions by:
- Mapping your host user ID to the container user
- Ensuring test results are created with proper ownership
- Allowing clean deletion of test artifacts without permission errors

## Test Structure

Tests are located in the `tests/` directory. The current test suite includes:

- **Homepage tests** (`tests/homepage.spec.ts`): Tests for the main landing page
  - Verifies welcome message display
  - Checks proper meta tags
  - Ensures no console errors

## Configuration

Playwright configuration is in `playwright.config.ts`. Key settings:

- Tests run against `http://localhost:3000`
- Automatically starts the dev server before running tests
- Uses Chromium browser by default
- Generates HTML reports for test results

### Docker Configuration

The Docker setup includes:
- `Dockerfile.playwright`: Playwright image with all browsers pre-installed
- `docker-compose.playwright.yml`: Services for running tests and UI mode
- No need to run `npx playwright install` when using Docker

## Benefits of Docker Approach

- **No browser installation**: All browsers are pre-installed in the Docker image
- **Consistent environment**: Same testing environment across all machines
- **Isolation**: Tests run in a clean, isolated container
- **CI/CD friendly**: Perfect for continuous integration environments

## CI/CD

The configuration is optimized for CI environments with:
- Retry logic for flaky tests
- Proper timeouts
- HTML reporting