# Playwright Testing

This project includes end-to-end tests using Playwright.

## Setup

1. Install dependencies:
```bash
npm install
```

2. Install Playwright browsers:
```bash
npx playwright install
```

## Running Tests

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

## CI/CD

The configuration is optimized for CI environments with:
- Retry logic for flaky tests
- Proper timeouts
- HTML reporting