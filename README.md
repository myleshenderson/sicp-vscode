# SICP Environment

An opinionated setup for studying "Structure and Interpretation of Computer Programs" (SICP) using [Racket](https://racket-lang.org/), [SICP language support](https://github.com/jeapostrophe/racket-sicp), and [VS Code](https://code.visualstudio.com/).

## Goals

- Provide a clean, opinionated setup for studying SICP
- Use Racket with SICP language support
- Provide a REPL for interactive evaluation
- Use VS Code as the editor

## Features

- Preconfigured Cursor/VS Code environment for SICP study
- Integrated REPL support
- Automatic file loading
- Clean terminal handling
- Recommended extensions

## Setup

### Prerequisites

1. Install VS Code
2. Clone this repository:
   ```bash
   git clone https://github.com/myleshenderson/sicp-vscode.git
   cd sicp-vscode
   ```

### Install Dependencies

Run the installation script to install Racket, SICP language support, and configure your PATH:
```bash
./scripts/install-deps.sh
```

### Racket PATH Configuration
The installation script will automatically configure your PATH. If you need to verify the installation:

#### macOS/Linux
1. Open your terminal
2. Run `which racket`
3. If no path is returned, add Racket to your PATH:
   ```bash
   # For bash (add to ~/.bashrc or ~/.bash_profile)
   export PATH="/path/to/racket/bin:$PATH"
   
   # For zsh (add to ~/.zshrc)
   export PATH="/path/to/racket/bin:$PATH"
   ```

Verify the installation by opening a new terminal and running:
```bash
which racket
```

### VS Code Configuration

This repository includes:
- `.vscode/tasks.json`: REPL task configuration
- `.vscode/extensions.json`: Recommended extensions
- `scripts/`: Utility scripts for REPL handling

VS Code will automatically prompt you to install the recommended Scheme extension when you open the project.

### Recommended Keybindings

This project includes recommended keybindings in `.vscode/keybindings.json`. To use them:

1. Copy the contents from `.vscode/keybindings.json`
2. Open the Command Palette (`Cmd+Shift+P` / `Ctrl+Shift+P`) and search for "Preferences: Open Keyboard Shortcuts (JSON)"
3. Paste the keybindings into your IDE keybindings file

These keybindings configure:
- `Ctrl+Option+N` / `Ctrl+Alt+N`: Start REPL

## Usage

1. Open any Scheme file (`.scm`), such as the src/test.scm file
2. Start the REPL:
   - Use the keyboard shortcut you set up in the previous section: `Cmd+Option+N` (Mac) or `Ctrl+Alt+n` (Windows/Linux)
3. The REPL will:
   - Start with SICP language support
   - Load the current file
   - Allow interactive evaluation
4. Exit the REPL with `Ctrl+D`

## License

This project is licensed under the MIT License - see the LICENSE file for details.
