## Format on Save

Available in v1.4.248 and above. Implemented in [#37716](https://github.com/stablyai/orca/pull/37716).

<!-- TODO Link https://onorca.dev/docs/settings once it documents this feature. -->

1. Settings / General / Editor / Format on Save: on (off by default)
2. Settings / Projects / (project) / Formatter Command: set command and glob

The command placeholder uses Prettier. For Oxfmt via Vite+:

```plaintext
vp fmt --stdin-filepath=${file}
```

Add `svelte` to the default include glob if `fmt.svelte` is enabled.
