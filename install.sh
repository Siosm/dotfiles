#!/usr/bin/env bash

# Stop if any command returns a non-zero value including when piping commands
set -e
set -o pipefail

# Use any argument to bypass this check
E_BADARGS=65
if [ ${#} -ne 1 ]; then
	printf "READ ME before blindly launching me!!\n"
	exit ${E_BADARGS}
fi

# Vim setup
rm -rf ~/.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/backup ~/.vim/undodir

# Install pathogen plugin
curl -Sso ~/.vim/autoload/pathogen.vim \
	https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

pushd ~/.vim/bundle/

# Open a file and go to specified line using <filename>:<line>
git clone https://github.com/bogado/file-line.git

# fugitive.vim: a Git wrapper so awesome, it should be illegal
git clone https://github.com/tpope/vim-fugitive.git

# Vim Markdown runtime files
git clone https://github.com/tpope/vim-markdown.git

# Vim Git runtime files
git clone https://github.com/tpope/vim-git.git

# precision colorscheme for the vim text editor
git clone https://github.com/altercation/vim-colors-solarized.git

# A secure alternative to Vim modelines
git clone https://github.com/ciaranm/securemodelines.git

# commentary.vim: comment stuff out
git clone https://github.com/tpope/vim-commentary.git

# Extended search commands and maps for Vim
git clone https://github.com/dahu/SearchParty.git

# Find a char across lines
git clone https://github.com/dahu/vim-fanfingtastic.git

# repeat.vim: enable repeating supported plugin maps with "."
git clone https://github.com/tpope/vim-repeat.git

# Syntax checking hacks for vim
git clone https://github.com/scrooloose/syntastic.git

# surround.vim: quoting/parenthesizing made simple
git clone https://github.com/tpope/vim-surround.git

# Rust support
git clone https://github.com/wting/rust.vim.git
# git clone https://github.com/racer-rust/vim-racer.git

# unimpaired.vim: pairs of handy bracket mappings
git clone https://github.com/tpope/vim-unimpaired.git

# Go development plugin for Vim
git clone https://github.com/fatih/vim-go.git

# Editor Config support
git clone https://github.com/editorconfig/editorconfig-vim.git

popd

# Shell setup
rm -rf ~/.shell
mkdir -p ~/.shell/history

pushd ~/.shell/

curl -Sso dircolors.256dark \
	https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark

git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

popd

./diff.sh

echo "[+] Done!"
