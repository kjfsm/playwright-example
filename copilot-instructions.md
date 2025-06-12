# Copilot Instructions - Playwright Testing Environment

## Project Overview

This is a Remix application with comprehensive Playwright end-to-end testing setup. The project demonstrates how to integrate Playwright testing with both local development and Docker-based testing environments.

## Key Features

### 1. Dual Testing Environment
- **Local Testing**: Direct Playwright execution with automatic browser installation
- **Docker Testing**: Containerized testing with Microsoft's official Playwright Docker image
- **Permission Management**: Proper file ownership handling for Docker environments

### 2. Testing Modes
- `npm run test` - Standard test execution
- `npm run test:ui` - Interactive UI mode for test development
- `npm run test:debug` - Debug mode with step-by-step execution
- `npm run test:docker` - Docker-based testing (preferred for CI/CD)
- `npm run test:docker:ui` - Docker UI mode accessible via browser

### 3. Cross-Platform Support
- Helper scripts for Windows (`scripts/docker-test.bat`) and Unix (`scripts/docker-test.sh`)
- Automatic user ID mapping for permission consistency
- Clean-up utilities for test artifacts

## Development Guidelines

### When to Use Each Testing Mode

1. **Local Development** (`npm run test`):
   - Quick feedback during development
   - Requires browser installation via `npx playwright install`
   - Best for rapid iteration

2. **Docker Testing** (`npm run test:docker`):
   - Consistent environment across different machines
   - No need for local browser installation
   - Preferred for CI/CD pipelines
   - Better isolation and reproducibility

3. **UI Mode** (`npm run test:ui` or `npm run test:docker:ui`):
   - Interactive test development
   - Visual debugging and test exploration
   - Test result inspection

### File Structure

```
tests/
├── README.md           # Comprehensive testing documentation
├── homepage.spec.ts    # Main page functionality tests
└── smoke.spec.ts       # Basic configuration validation

scripts/
├── docker-test.sh      # Unix helper script
└── docker-test.bat     # Windows helper script

Dockerfile.playwright           # Playwright Docker configuration
docker-compose.playwright.yml   # Docker Compose services
playwright.config.ts           # Playwright configuration
```

### Configuration Highlights

- **Auto Server Start**: Automatically starts Remix dev server before tests
- **CI Optimization**: Retry logic and timeouts configured for CI environments
- **HTML Reporting**: Comprehensive test reports generated automatically
- **Trace Collection**: Debug traces captured on test failures

### Common Commands

```bash
# Initial setup
npm install
npx playwright install  # Only needed for local testing

# Local testing
npm run test            # Run all tests
npm run test:ui         # Interactive mode
npm run test:debug      # Debug mode

# Docker testing (recommended)
npm run test:docker:build    # Build Docker image
npm run test:docker          # Run tests in Docker
npm run test:docker:ui       # UI mode in Docker (access via http://localhost:9323)
npm run test:docker:clean    # Clean up test artifacts

# Helper scripts
./scripts/docker-test.sh test     # Unix/Linux/macOS
scripts\docker-test.bat test      # Windows
```

### Troubleshooting

1. **Permission Issues with Docker**:
   - Use `npm run test:docker:clean` to safely remove test artifacts
   - The setup automatically handles user ID mapping to prevent permission conflicts

2. **Port Conflicts**:
   - Remix dev server runs on port 3000
   - Playwright UI runs on port 9323
   - Ensure these ports are available

3. **Docker Build Issues**:
   - Run `npm run test:docker:build` to rebuild the image
   - Check Docker daemon is running

### Testing Best Practices

1. **Write Descriptive Tests**: Each test should clearly state what it's validating
2. **Use Page Object Model**: For complex applications, consider page objects
3. **Parallel Execution**: Tests run in parallel by default for faster execution
4. **Proper Waits**: Use Playwright's auto-waiting features instead of hardcoded delays
5. **Visual Testing**: Leverage Playwright's screenshot capabilities for visual regression testing

### Environment Variables

- `CI=true`: Enables CI-specific configurations (retries, workers)
- `USER_ID` / `GROUP_ID`: For Docker permission mapping (automatically set)

### Integration with IDEs

- Playwright Test extension available for VS Code
- Test debugging support with breakpoints
- Test generation capabilities

## Development Workflow

1. **Adding New Tests**:
   - Create `.spec.ts` files in the `tests/` directory
   - Follow existing naming conventions
   - Use Docker testing for final validation

2. **CI/CD Integration**:
   - Use Docker-based testing for consistent results
   - Configure proper timeouts and retries
   - Generate and store test reports as artifacts

3. **Local Development**:
   - Use UI mode for test creation and debugging
   - Run quick tests locally, comprehensive tests in Docker
   - Clean up test artifacts regularly