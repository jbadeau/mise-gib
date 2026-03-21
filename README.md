# mise-gib

[mise](https://mise.jdx.dev) plugin for [gib](https://github.com/jbadeau/gib) (Go Container Builder).

## Usage

```bash
mise plugin install gib https://github.com/jbadeau/mise-gib.git

mise install gib@0.1.0

mise use gib@0.1.0
```

Alternatively, add the plugin and tool directly in your `mise.toml`:

```toml
[plugins]
gib = "https://github.com/jbadeau/mise-gib.git"

[tools]
gib = "0.1.0"
```

## Supported Platforms

| OS      | Architecture |
|---------|-------------|
| Linux   | amd64, arm64 |
| macOS   | amd64, arm64 |
| Windows | amd64, arm64 |
