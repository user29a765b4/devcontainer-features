#!/bin/sh
set -eu

# Function to install Codex CLI
install_codex_cli() {
    echo "Installing Codex CLI..."

    # Place the configuration file in the non-root user's home directory.
    if [ "${_REMOTE_USER}" != "root" ]; then
        su - "${_REMOTE_USER}" <<'EOF'
        curl -fsSL https://chatgpt.com/codex/install.sh | sh
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
        echo 'export PATH="$HOME/.local/bin:$PATH"' >>  ~/.bashrc
        echo 'export PATH="$HOME/.local/bin:$PATH"' >>  ~/.zshrc
        export PATH="$HOME/.local/bin:$PATH"
EOF
    fi

    if su - "${_REMOTE_USER}" -c 'command -v codex >/dev/null'; then
        echo "Codex CLI installed successfully!"
        return 0
    else
        echo "ERROR: Codex CLI installation failed!"
        return 1
    fi
}

# Main script starts here
main() {
    echo "Activating feature 'codex-cli'"

    # Install Codex CLI
    install_codex_cli || exit 1
}

# Execute main function
main