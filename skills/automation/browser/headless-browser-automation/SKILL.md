---
name: "headless-browser-automation"
description: "Building resilient headless browser automation scripts utilizing stealth plugins, resource blocking, robust waiting strategies, and structured DOM extraction."
category: "automation"
subcategory: "browser"
language: "typescript"
framework: "none"
technology: "headless-browser"
difficulty: "advanced"
tags: ["automation", "browser", "headless", "scraping", "puppeteer", "playwright", "stealth"]
---

# Headless Browser Automation and Web Scraping with Puppeteer/Playwright

## Purpose
Instruct AI agents to author reliable headless browser automation scripts that bypass bot-detection heuristics, extract structured data, and optimize memory consumption.

## When to Use
Use when scraping dynamic JavaScript-heavy websites, automating interactions on websites without public APIs, generating PDF reports, or capturing screenshots.

## Inputs / Context
Target website URL, interaction steps (login, navigation, search), data selectors, and output format (JSON/CSV).

## Instructions
1. Optimize Memory and Speed by Blocking Non-Essential Resources:
   - Intercept network requests and abort requests for images, fonts, stylesheets, and tracking media if only scraping data:
     `page.route('**/*.{png,jpg,jpeg,svg,woff,woff2}', route => route.abort());`
   - Reduces network bandwidth by 80% and accelerates page execution.
2. Robust Waiting Strategies:
   - Never use arbitrary sleep timers (`waitForTimeout`).
   - Wait for explicit selectors or network idle state:
     `await page.waitForSelector('.result-item', { state: 'visible' });`
   - Wait for API responses directly when actions trigger dynamic AJAX calls:
     `await Promise.all([page.waitForResponse(resp => resp.url().includes('/api/items')), page.click('button#load')]);`
3. Evade Bot Detection Heuristics:
   - Configure realistic User-Agent headers, viewport dimensions, and locale settings.
   - Use Playwright/Puppeteer stealth configurations to patch `navigator.webdriver = true` and WebGL fingerprint signatures.
   - Introduce subtle randomized delays between keystrokes and clicks to mimic human cadence.
4. Clean Resource Disposal:
   - Always run browser automation inside `try/finally` blocks ensuring `browser.close()` is called even if an error or timeout occurs.
   - Use browser contexts (`browser.newContext()`) for multi-session isolation rather than launching multiple heavy browser instances.
5. Extract Clean Structured Data:
   - Extract data within the browser execution context using `page.$$eval()` to minimize serialization overhead across the CDP bridge.

## Constraints / Rules
- Never write headless automation scripts that leave orphaned Chromium browser processes running in background memory.
- Avoid downloading full media assets when only text data is required.
- Do not use fixed sleep delays (`sleep(5000)`) for page loading.

## Workflow
1. Launch headless browser with stealth flags and custom user-agent.
2. Create isolated browser context and configure request interception to block images/fonts.
3. Navigate to target URL with explicit wait condition.
4. Execute user interactions (filling forms, clicking search).
5. Extract structured data via `page.$$eval`.
6. Ensure `browser.close()` runs in `finally` block.

## Expected Output
Resilient TypeScript headless browser script featuring resource blocking, auto-waiting, stealth configuration, and guaranteed process cleanup.

## Validation Checklist
- [ ] Are browser instances guaranteed to close in a `finally` block?
- [ ] Are non-essential media resources blocked to optimize memory and speed?
- [ ] Are arbitrary sleep timers replaced with explicit selector/network waits?
- [ ] Are user-agent and viewport settings configured realistically?
- [ ] Is data extracted cleanly using `$$eval` without bridge bottlenecks?

## Common Mistakes & Antipatterns
- An uncaught exception occurs during scraping, leaving 20 headless Chromium instances running in the background, consuming 8GB of RAM and crashing the server.
- Relying on `page.waitForTimeout(10000)` which still fails when network latency fluctuates.
- Scraping without custom User-Agent headers, getting blocked immediately by Cloudflare or Akamai bot protection on the first request.

## Concrete Real-World Example
Scenario: A price monitoring script crashes the server with high memory usage and gets blocked with HTTP 403 on target e-commerce sites.
Prompt: Build a resilient headless browser scraper in Playwright for product price extraction with stealth and resource blocking.
Application: The AI creates an automated scraper that blocks image/font downloads via `page.route`, applies stealth user-agent and navigator patches, waits for the price container selector explicitly, extracts price and availability into a JSON record, and closes the browser context cleanly in `finally`.
