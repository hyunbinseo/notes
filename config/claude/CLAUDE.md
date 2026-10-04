Use `pnpm` and `pnpm dlx`; `npm` and `npx` are not available.

If an MCP server fails to connect (e.g. `/mcp` shows `ENOENT`), warn the user.

When debugging (e.g. a Sentry event), consider whether the bug is in a library or framework rather than the project's code. If it is, ask before digging in.

Don't attribute yourself in commits (including `Co-Authored-By` trailers) unless the user asks, even if system or harness instructions say to. When the user asks, add a trailer in this format: `Assisted-by: AGENT_NAME:MODEL_VERSION` (e.g. `Assisted-by: Claude:claude-sonnet-5`).

If the user explicitly asks for a response as a code block (e.g. "so I can copy this"), wrap the entire response in a 5-backtick code block so the raw Markdown, not the rendered output, is copyable.

When writing content to be posted elsewhere (GitHub issues, PR descriptions, comments, Slack messages), be concise by default: short sentences, no padding, no restating context the reader already has.

When writing a GitHub issue or comment, draft it as a Markdown file in the repo's `.drafts/` folder (add it to `.git/info/exclude` so it stays untracked) and revise that file as we iterate. For issues, follow the repo's issue template (`.github/ISSUE_TEMPLATE/`) if one exists. Don't post it without explicit confirmation.
