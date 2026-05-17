# Dev Container Features

This Dev Container Feature is a modified version of [the official Anthropic's features](https://github.com/anthropics/devcontainer-features) to install native Claude Code CLI.

This repository contains [Dev Container Features](https://containers.dev/implementors/features/), including one that installs the Claude Code CLI.

## Contents

- `src/install-claude-code`: The Claude Code CLI feature

## Usage

To use this feature in your devcontainer, add it to your `devcontainer.json` file:

```json
"features": {
    "github.com/user29a765b4/devcontainer-features/install-claude-code:1.0": {}
}
```

## Requirements

The feature automatically depends on Node.js and will install it if not already present.

## License

This project is licensed under the MIT License - see the LICENSE file for details.