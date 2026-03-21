# mise-gcb

[mise](https://mise.jdx.dev) plugin for [gcb](https://github.com/jbadeau/gcb) (Go Container Builder).

## Usage

```bash
mise plugin install gcb https://github.com/jbadeau/mise-gcb.git

mise install gcb@0.1.0

mise use gcb@0.1.0
```

Alternatively, add the plugin and tool directly in your `mise.toml`:

```toml
[plugins]
gcb = "https://github.com/jbadeau/mise-gcb.git"

[tools]
gcb = "0.1.0"
```

## Supported Platforms

| OS      | Architecture |
|---------|-------------|
| Linux   | amd64, arm64 |
| macOS   | amd64, arm64 |
| Windows | amd64, arm64 |
