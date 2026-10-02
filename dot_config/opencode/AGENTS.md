# Browser preference

For browser or website tasks, use the `browser-harness` MCP server first. Fall back to the `playwright` MCP server only if browser-harness is unavailable or fails. Do not use Brave, Chrome, an in-app browser, browser DevTools, or a headless fetcher unless both are unavailable or the user explicitly requests another browser.

Use an agent-owned tab, preserve the user’s tabs, and follow a snapshot -> act -> verify workflow.