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

- Title only. Add a body only when asked.
- When asked for attribution, add an `Assisted-by: <agent>:<model>` trailer (e.g. `Assisted-by: Claude:claude-opus-5-5`).

## Writing

Draft content to be posted elsewhere (GitHub issues, PR descriptions, comments, Slack messages) as Markdown files:

- Save them in the repo's `.drafts/` folder and revise them there.
  - If the global gitignore lacks `.drafts/`, add it.
  - Outside a Git repo, ask where to save them.
- Keep them concise: short sentences, no padding or restated context.
- Follow the repo's issue or PR template if one exists.
- End GitHub references with a space or punctuation (not `#70처럼`).
- Don't post without explicit confirmation.
