#!/bin/bash

# Use any argument to bypass this check
E_BADARGS=65
if [ $# -ne 1 ]; then
	echo "READ ME before blindly launching me!!"
	exit $E_BADARGS
fi

ORIGIN_WD=$PWD

rm -rf ~/.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle

# Install pathogen plugin
curl -Sso ~/.vim/autoload/pathogen.vim \
	https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd ~/.vim/bundle/

# Open a file and go to specified line using <filename>:<line>
git clone https://github.com/bogado/file-line.git

# fugitive.vim: a Git wrapper so awesome, it should be illegal
git clone https://github.com/tpope/vim-fugitive.git

# snipMate.vim aims to be a concise vim script that implements some of
# TextMate's snippets features in Vim
git clone https://github.com/garbas/vim-snipmate.git
# snipMate dependencies
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/honza/snipmate-snippets.git

# Vim Markdown runtime files
git clone https://github.com/tpope/vim-markdown.git

# The ultimate vim statusline utility
git clone https://github.com/Lokaltog/vim-powerline

# Vim Git runtime files
git clone https://github.com/tpope/vim-git.git

# precision colorscheme for the vim text editor
git clone https://github.com/altercation/vim-colors-solarized.git

# A secure alternative to Vim modelines
git clone https://github.com/ciaranm/securemodelines.git

# commentary.vim: comment stuff out
git clone https://github.com/tpope/vim-commentary.git

# Clone special font for Powerline, don't forget to use it in your terminal
# https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline

cd "${ORIGIN_WD}"
./diff.sh

echo "Don't forget to install the following packages (Arch Linux):"
echo " * vim-spell-en"
echo " * vim-doxygentoolkit"

