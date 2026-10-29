Use [Vite+](https://viteplus.dev/) commands instead of package-manager-specific ones:

```shell
vpr <script>  # package.json scripts
vp exec <bin> # project binaries
vpx <package> # local, else downloaded
```

Don't use Vite+ built-ins (e.g. `vp fmt`, `vp test`) unless instructed. Use the project's scripts instead.

If an MCP server fails to connect (e.g. `/mcp` shows `ENOENT`), warn the user.

When debugging (e.g. a Sentry event), consider whether the bug is in a library or framework rather than the project's code. If it is, ask before digging in.

When the user asks for attribution in a commit, add a trailer in this format: `Assisted-by: AGENT_NAME:MODEL_VERSION` (e.g. `Assisted-by: Claude:claude-sonnet-5`).

If the user explicitly asks for a response as a code block (e.g. "so I can copy this"), wrap the entire response in a 5-backtick code block so the raw Markdown, not the rendered output, is copyable.

When writing content to be posted elsewhere (GitHub issues, PR descriptions, comments, Slack messages), be concise by default: short sentences, no padding, no restating context the reader already has.

When writing a GitHub issue or comment, draft it as a Markdown file in the repo's `.drafts/` folder (add it to `.git/info/exclude` so it stays untracked) and revise that file as we iterate. For issues, follow the repo's issue template (`.github/ISSUE_TEMPLATE/`) if one exists. Don't post it without explicit confirmation.
