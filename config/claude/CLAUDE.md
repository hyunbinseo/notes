## Claude Code

Warn the user if a needed MCP tool is unavailable (e.g. its server failed to connect), even if you can work around it.

## Vite+

Use [Vite+](https://viteplus.dev/) instead of npm, pnpm, or yarn:

```shell
# command       # pnpm equivalent
vpr <script>    # pnpm run
vp exec <bin>   # pnpm exec
vpx <pkg>       # pnpm exec, else pnpm dlx
vp add <pkg>    # pnpm add
vp pm <command> # pnpm <command>
```

Prefer the project's scripts over Vite+ tool commands (e.g. `vp fmt`, `vp check`, `vp test`).

## Debugging

When debugging (e.g. a Sentry event), consider whether the bug is in a library or framework. If so, ask before reading its source, patching `node_modules`, or drafting an upstream issue.

## Git Commits

When the user asks for attribution in a commit, add a trailer in this format: `Assisted-by: AGENT_NAME:MODEL_VERSION` (e.g. `Assisted-by: Claude:claude-sonnet-5`).

## Writing

When writing content to be posted elsewhere (GitHub issues, PR descriptions, comments, Slack messages), be concise by default: short sentences, no padding, no restating context the reader already has.

When writing a GitHub issue or comment, draft it as a Markdown file in the repo's `.drafts/` folder (add it to `.git/info/exclude` so it stays untracked) and revise that file as we iterate. For issues, follow the repo's issue template (`.github/ISSUE_TEMPLATE/`) if one exists. Don't post it without explicit confirmation.
