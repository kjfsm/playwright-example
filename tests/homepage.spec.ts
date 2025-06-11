import { test, expect } from '@playwright/test';

test.describe('Homepage', () => {
  test('should display welcome message', async ({ page }) => {
    await page.goto('/');
    
    // Check that the page loads successfully
    await expect(page).toHaveTitle(/Welcome to Remix/);
    
    // Check for the welcome text
    await expect(page.locator('h1')).toContainText('Welcome to');
    
    // Check that the Remix logo is present
    await expect(page.locator('img[alt="Remix"]')).toBeVisible();
    
    // Check for the "What's next?" text
    await expect(page.locator('text=What\'s next?')).toBeVisible();
  });

  test('should have proper meta tags', async ({ page }) => {
    await page.goto('/');
    
    // Check viewport meta tag
    const viewport = page.locator('meta[name="viewport"]');
    await expect(viewport).toHaveAttribute('content', 'width=device-width, initial-scale=1');
    
    // Check charset
    const charset = page.locator('meta[charset="utf-8"]');
    await expect(charset).toBeVisible();
  });

  test('should load page without console errors', async ({ page }) => {
    const consoleErrors: string[] = [];
    
    page.on('console', (msg) => {
      if (msg.type() === 'error') {
        consoleErrors.push(msg.text());
      }
    });
    
    await page.goto('/');
    
    // Wait for page to fully load
    await page.waitForLoadState('networkidle');
    
    // Check that there are no console errors
    expect(consoleErrors).toHaveLength(0);
  });
});