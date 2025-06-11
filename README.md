# Welcome to Remix!

- 📖 [Remix docs](https://remix.run/docs)

## Development

Run the dev server:

```sh
npm run dev
```

## Testing

This project includes end-to-end tests using Playwright with two setup options:

### Local Setup
```sh
# Install Playwright browsers (required for first run)
npx playwright install

# Run tests
npm run test

# Run tests with UI
npm run test:ui
```

### Docker Setup (Recommended)
```sh
# Build Docker image (no browser installation needed)
npm run test:docker:build

# Run tests with Docker
npm run test:docker

# Run tests with UI using Docker
npm run test:docker:ui
```

The Docker approach eliminates the need to install browsers locally and ensures consistent test environments.

See `tests/README.md` for detailed testing documentation.

## Deployment

First, build your app for production:

```sh
npm run build
```

Then run the app in production mode:

```sh
npm start
```

Now you'll need to pick a host to deploy it to.

### DIY

If you're familiar with deploying Node applications, the built-in Remix app server is production-ready.

Make sure to deploy the output of `npm run build`

- `build/server`
- `build/client`

## Styling

This template comes with [Tailwind CSS](https://tailwindcss.com/) already configured for a simple default starting experience. You can use whatever css framework you prefer. See the [Vite docs on css](https://vitejs.dev/guide/features.html#css) for more information.
