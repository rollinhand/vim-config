#!/bin/bash
# definition of plugin directory
plug_dir=~/.vim/pack/plugins
snippets_dir=~/.vim/snippets

# Initializes Vim plugin directory if it does not exists.
#
# No arguments.
#
function init() {
    if [ ! -d $plug_dir ]; then
        echo "creating plugin directory $plug_dir"
        mkdir -p "$plug_dir"
        mkdir -p "$plug_dir/start"
        mkdir -p "$plug_dir/opt"
    fi;
}

# Clone or update a git repository in the current directory
#
# Arguments:
#   repo_url: an URL to git repository
#   mode: start or opt (default is start)
#
function plugin() {
    repo_url=$1
    mode=${2:-"start"}
    plugin_name=$(basename "$repo_url" .git)
    target_dir=$plug_dir/$mode/$plugin_name
    
    if [ -d "$target_dir" ]; then
        cd "$target_dir" || exit
        result=$(git pull --force)
        echo "--> updating plugin $plugin_name: $result"
    else
        cd "$plug_dir/$mode"
        echo "--> installing plugin $plugin_name"
        git clone -q "$repo_url"
    fi;
    cd "$plug_dir" || exit
}

function snippets() {
    repo_url=$1
    if [ ! -d "$snippet_dir" ]; then
        echo "creating snippet directory"
        mkdir -p "$snippet_dir"
        echo "--> installing snippets from $repo_url"
        git clone -q "$repo_url"
    else
        result=$(git pull --force)
        echo "--> updating snippets from $repo_url"
    fi;


}

echo "loading plugins for Vim 8"
init

echo "loading plugins..."
plugin https://github.com/tpope/vim-markdown.git "start"
plugin https://github.com/vim-airline/vim-airline "start"
plugin https://github.com/vim-airline/vim-airline-themes "start"
plugin https://github.com/scrooloose/nerdtree "start"
plugin https://github.com/Xuyuanp/nerdtree-git-plugin "start"

# -- advanced markdown support
plugin https://github.com/godlygeek/tabular "start"
plugin https://github.com/plasticboy/vim-markdown.git "start"

# -- autocompletion tools
plugin https://github.com/rhysd/github-complete.vim "start"
plugin https://github.com/artur-shaik/vim-javacomplete2 "start"

#-- colorscheme
plugin https://github.com/sickill/vim-monokai "start"

# -- managing snippets
plugin https://github.com/tomtom/tlib_vim.git "start"
plugin https://github.com/MarcWeber/vim-addon-mw-utils.git "start"
plugin https://github.com/garbas/vim-snipmate.git "start"

# -- must be always installed after nerdtree and vim-airline
# additional fonts needed to work
#plugin https://github.com/ryanoasis/vim-devicons "start"   # no further options
echo "loading finished."
