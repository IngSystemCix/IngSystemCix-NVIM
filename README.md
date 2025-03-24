# IngSystemCix-Nvim

> [!NOTE]
> Now it supports word wrap and includes a project browser. Additionally, it has
> support for linters for Python, TypeScript, HTML, and more. Emmet has also
> been added. It also supports React, HTTP requests, GraphQL, and Tailwind CSS.

![main](./assets/principal.png)

## Installation

### Install Nerd Fonts

1. You need to install NeoVim for Windows, which you can download from [here](https://neovim.io/).
2. To install Nerd Fonts, follow these steps:
   1. Visit the [official Nerd Fonts website](https://www.nerdfonts.com/).
   2. Download the font of your choice.
   3. Extract the downloaded file.
   4. Install the font on your operating system.

#### Instructions by Operating System

- **Windows**:
  - Right-click on the font file and select "Install".
- **macOS**:
  - Double-click on the font file and then click "Install Font".
- **Linux**:
  - Copy the font files to the `~/.local/share/fonts` directory and run `fc-cache -fv` in the terminal.

Once the font is installed, make sure to configure your terminal to use it.

### Configuration for Windows Users

To configure PowerShell, navigate to the following path and replace `${username}` with your username:

`C:\Users\${username}\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`

Add the following configuration:

```json
{
  "actions": [
    {
      "keys": "ctrl+space",
      "command": {
        "action": "sendInput",
        "input": "\u001b[32;5u"
      }
    }
  ]
}
```

Next, clone the repository:

`git clone https://github.com/IngSystemCix/IngSystemCix-NVIM.git`

Then, copy the contents of the cloned project and paste them into the following path:

`C:\Users\${username}\AppData\Local\nvim`

> [!NOTE]
> After placing all the files in the nvim folder, you need to open PowerShell as an administrator and run the following command:

`Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim\.git", "$env:LOCALAPPDATA\nvim\assets"`

Before running, you need to install this C compiler:

> [!warning]
> This command only runs in Windows PowerShell

`winget install Zig.Zig`

`winget install sharkdp.fd`

> [!NOTE]
> Don't forget to install Python for the linter. If you don't need it, you can modify the files and remove it.

For more information, visit the [official website](https://www.python.org/).

Additionally, we need to install the following dependencies on our system using Node.js:

`npm install -g @angular/language-server`

`npm install -g @angular/cli`

`npm install -g typescript@latest`

`npm install -g htmlhint`

`npm install -g @tailwindcss/language-server`

`npm install -g neovim`

> [!NOTE]
> Additionally, you must install `jq`. You can find more information [here](https://jqlang.org/).

> [!NOTE]
> If the folder does not exist, create it.

> [!NOTE]
> If in the event that no Mason plugin is installed, you should use the following steps and manually install each one with this command:

`:MasonInstall angular-language-server biome black emmet-language-server eslint_d gitui glint htmlhint lua-language-server markdown-toc markdownlint markdownlint-cli2 prettier pylint python-lsp-server shfmt stylua typescript-language-server`
