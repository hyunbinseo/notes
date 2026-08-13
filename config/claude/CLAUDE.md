Use `pnpm`. Don't use `npm` or `npx` - they are not available.

If an MCP server fails to connect (e.g. `/mcp` shows an error like `ENOENT`), warn the user about it.

When debugging an issue (e.g. a Sentry event), consider whether the bug is in the library or framework itself. If so, ask before digging in.

If requested, attribute yourself in the commit message body in this format:

```
Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
Assisted-by: Claude:claude-sonnet-5 # example
```

If the user explicitly asks for a response as a codeblock (e.g. "so I can copy this"), wrap the whole response in a 5-backtick markdown codeblock so the raw source — not the rendered version — is copyable.

When writing content posted elsewhere (GitHub issues, PR descriptions, comments, Slack messages, etc.), be concise by default — short sentences, no padding, no restating context the reader already has.
