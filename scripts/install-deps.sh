#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Function to add Racket to PATH in shell config
configure_path() {
    local shell_config
    local racket_path="$1"
    
    # Determine shell config file
    if [ -n "$ZSH_VERSION" ]; then
        shell_config="$HOME/.zshrc"
    elif [ -n "$BASH_VERSION" ]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            shell_config="$HOME/.bash_profile"
        else
            shell_config="$HOME/.bashrc"
        fi
    else
        echo "Unsupported shell. Please add Racket to PATH manually."
        return 1
    fi
    
    # Add PATH export if not already present
    if ! grep -q "export PATH=\"$racket_path/bin:\$PATH\"" "$shell_config"; then
        echo "" >> "$shell_config"
        echo "# Add Racket to PATH" >> "$shell_config"
        echo "export PATH=\"$racket_path/bin:\$PATH\"" >> "$shell_config"
        echo "Added Racket to PATH in $shell_config"
        echo "Please restart your terminal or run: source $shell_config"
    fi
}

# Install Racket if not present
if ! command_exists racket; then
    echo "Racket not found. Installing..."
    
    # Check OS type
    case "$(uname -s)" in
        Darwin*)
            # Check if Homebrew is installed
            if ! command_exists brew; then
                echo "Homebrew not found. Installing..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
            brew install racket
            
            # Configure PATH for Mac
            racket_path="$(brew --prefix)/opt/racket"
            configure_path "$racket_path"
            ;;
        Linux*)
            sudo apt-get update
            sudo apt-get install -y racket
            
            # Configure PATH for Linux
            racket_path="/usr/bin"  # Default Linux install location
            configure_path "$racket_path"
            ;;
        *)
            echo "Unsupported operating system. Please install Racket manually from racket-lang.org"
            exit 1
            ;;
    esac
else
    echo "Racket is already installed at: $(which racket)"
fi

# Verify Racket is in PATH
if ! command_exists racket; then
    echo "Error: Racket installation completed but 'racket' command not found."
    echo "Please restart your terminal or manually add Racket to your PATH."
    exit 1
fi

# Install sicp package
echo "Installing SICP language pack..."
raco pkg install --auto sicp

echo "Dependencies installed successfully!"
echo "Note: You may need to restart your terminal for PATH changes to take effect." 