### SETTING UP NVIM ON WINDOWS 10 (unsing SCOOP to install neovim first) 
---
- Create a new directory in ``C:\Users\<USERNAME>\AppData\Local\nvim``
		- put ur init.vim in there once you create it 

#### Setup using LUA 
---
- This is where all our LUA is going to live ``C:\Users\<USERNAME>\scoop\apps\neovim\0.7.0\share\nvim\runtime\lua``
  - If you're cloning this REPO just take the lua folder and place at that address above `runtime\`

- After setting up our INIT.VIM most of our plugin setup is going to live in this file ``~\scoop\apps\neovim\0.7.0\share\nvim\runtime\lua\plugins.lua``
- since we're using the LUA config we're going to be using PACKER for our plugins, make sure to copy it to a packpath 
``git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"``

- Since we're using a LUA setup we can split up all our files to make things much easier to navigate/edit, which is what I did in this repo

- You might have some errors if you're doing a fresh installation but once you get past the initial errors just do a "PackerInstall" command to install the
missing plugins
- certain plugins like TREE SITTER which is our code parser/linter needs NODEJS/NPM installed and a C Compiler in the ``$PATH variable`` 

- to check stuff use the command ``:checkhealth`` to see what you're missing so nvim can work optimally
- for ease of access you can Create symlink to config folder where the init.vim is to the >>> inside runtime nvim folder/plugin/config 

- instead of MANUALLY installing all the LSP servers, I'm using `williamboman/nvim-lsp-installer` to do the initial install then 
any manual setup within the `lsp_setup.lua` file I added 

#### For Ease using SYMLINK on Windows for quicker access to the above folders 
---
- Open up the DEFAULT Windows CMD(actual windows CMD the black background) use `mklink` command  `mklink /j Link(where to make the link) Target(what to link))`
- Make sure that the LINK target/folder doesn't exist, it will be created

With this any changes you make to the newly created folders should also happen within the ACTUAL folders they're linked to.
