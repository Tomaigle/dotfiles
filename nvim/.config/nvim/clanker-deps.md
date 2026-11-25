# LazyVim config: dependencies

Targets: C, C++, ROS 2, web (JS/TS/PHP), Python. Also LaTeX, Swift, Haskell.
Run on host (Fedora) and in the `ros2-jazzy` container (Ubuntu 24.04, bash). Config shared via symlink.

Check after install: `:checkhealth lazyvim`, `:checkhealth vim.lsp`, `:Mason`.

## 1. Core (host + container)

| Tool | Why |
|------|-----|
| neovim >= 0.11.2 | LazyVim v15. Ubuntu apt too old, use tarball |
| git >= 2.19 | lazy.nvim, plugins |
| curl, wget, unzip, tar, gzip | Mason installs |
| gcc, g++, make | treesitter parser builds |
| tree-sitter-cli | treesitter parser compile (required by current nvim-treesitter) |
| ripgrep (`rg`) | Snacks grep picker |
| fd | Snacks file picker. Ubuntu binary is `fdfind`, symlink to `fd` |
| fzf | pickers, fzf-lua fallbacks |
| lazygit | `<leader>gg` |
| nodejs + npm | Mason: LSPs, prettier, eslint; tree-sitter-cli on Ubuntu |
| python3, pip, venv, pipx | Mason Python tools, basedpyright |
| jq | colcon `compile_commands.json` merge (`ros2.lua`) |
| wl-clipboard, xclip | system clipboard (Wayland / X11) |
| Nerd Font | host terminal only (WezTerm) |

## 2. C / C++

| Tool | Why |
|------|-----|
| clangd, clang-tidy, clang-format | LSP, lint, format (`lsp.lua` has `mason = false`, must be on PATH) |
| cmake, ninja | `cmake-tools.nvim` (`-GNinja`) |
| gdb, lldb | debug, `lldb-dap` |
| codelldb | Mason (auto), used by `cmake_dap_configuration` |
| googletest (`libgtest-dev`) | `neotest-gtest` |

## 3. ROS 2 (container)

| Tool | Why |
|------|-----|
| ros-jazzy-desktop(-full) | base image |
| python3-colcon-common-extensions | colcon |
| python3-rosdep | deps |
| jq | compile_commands merge |
| `source /opt/ros/jazzy/setup.bash` | in container `~/.bashrc`, so `ros2` CLI and `rclpy` resolve for nvim-ros2 pickers and basedpyright |
| `source <ws>/install/setup.bash` | same, for workspace packages |

## 4. Python

| Tool | Why |
|------|-----|
| basedpyright | LSP (`mason = false`, install with pipx) |
| ruff | Mason (auto) |
| debugpy | Mason (auto), DAP |
| python3-venv | venvs |

## 5. Web

| Tool | Why |
|------|-----|
| node >= 20 (recommended) | Ubuntu 24.04 apt has 18, use nodesource / fnm if an LSP complains |
| php-cli (>= 8.1), composer | phpactor, PHP labs |
| docker / podman | `lang.docker`, PHP + MariaDB labs (host) |
| Mason (auto) | vtsls, eslint, prettier, tailwindcss-ls, json-lsp, yaml-ls, taplo, html-lsp, css-lsp, emmet-language-server, lemminx, docker LSPs, hadolint, sqlfluff, markdownlint-cli2 |

## 6. LaTeX (host)

| Tool | Why |
|------|-----|
| texlive (medium or larger), latexmk | vimtex compiler |
| zathura + zathura-pdf-mupdf | vimtex viewer (`zathura_simple`) |
| texlab, tex-fmt | Mason (auto) |

## 7. Optional languages

| Tool | Why |
|------|-----|
| ghcup (ghc, cabal, hls) | `lang.haskell` |
| swift toolchain, sourcekit-lsp, lldb-dap | `swift.lua` (swift-dev box, paths in `~/.local/bin`) |
| rustup | `lang.rust`, overseer `rustc` runner |
| go | `lang.go` (prune if unused) |
| JDK 17+ | `lang.java` (prune if unused) |
| fish | Snacks terminal shell (`snacks.lua`) |
| ImageMagick | optional, Snacks image |
| wezterm CLI | smart-splits pane integration (host; container optional) |

## 8. Install commands

### Fedora host

```bash
sudo dnf install -y neovim git curl wget unzip tar gzip make gcc gcc-c++ cmake ninja-build \
  clang clang-tools-extra gdb lldb ripgrep fd-find fzf jq nodejs npm python3 python3-pip pipx \
  wl-clipboard xclip php-cli composer tree-sitter-cli fish \
  zathura zathura-pdf-mupdf latexmk texlive-scheme-medium
pipx install basedpyright
# lazygit: COPR or release tarball (see below)
```

### Ubuntu 24.04 container (ros2-jazzy)

```bash
sudo apt update && sudo apt install -y git curl wget unzip tar gzip build-essential \
  cmake ninja-build clangd-18 clang-tidy clang-format gdb lldb ripgrep fd-find fzf jq \
  nodejs npm python3 python3-pip python3-venv pipx wl-clipboard xclip php-cli composer \
  python3-colcon-common-extensions python3-rosdep libgtest-dev
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-18 100
mkdir -p ~/.local/bin && ln -sf "$(which fdfind)" ~/.local/bin/fd
pipx ensurepath && pipx install basedpyright
sudo npm i -g tree-sitter-cli
```

### Neovim tarball (container)

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
```

### lazygit (container, or host without COPR)

```bash
LG=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LG}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit && sudo install lazygit /usr/local/bin
```

### Container `~/.bashrc`

```bash
source /opt/ros/jazzy/setup.bash
[ -f ~/Coding/ros2/mefe_ws/install/setup.bash ] && source ~/Coding/ros2/mefe_ws/install/setup.bash
export PATH="$HOME/.local/bin:$PATH"
```

## 9. Known container gaps (accepted)

- `wezterm` CLI absent: smart-splits moves only inside nvim.
- `zathura`, LaTeX: use host nvim.
- `fish` absent: Snacks terminal fails unless installed or `shell = "bash"`.
- Swift tools absent: swift LSP/DAP just do not start.
