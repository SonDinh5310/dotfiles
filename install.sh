#!/bin/bash
# this script is copied from GeekMasher (https://github.com/GeekMasher) dotfiles repository

set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PRESENT=false

DOT_FOLDERS="alacritty,bash,starship,zsh"

echo "[+] Dotfiles :: $SCRIPT_DIR"

if ! command -v stow &> /dev/null; then
    sudo apt install -y stow
fi

for folder in $(echo $DOT_FOLDERS | sed "s/,/ /g"); do
    echo "[+] Folder :: $folder"

    stow -t $HOME -D $folder \
        --ignore=README.md --ignore=LICENSE --ignore=./alacritty/themes
    stow -t $HOME $folder
done

# Look for DOT_FOLDER in the .env
# while IFS= read -r var; do
#   [[ $var =~ ^DOT_FOLDER.* ]] && PRESENT=true
# done < "$HOME/.env"

# If not present, write the DOT_FOLDER var into the file
# if [[ $PRESENT == "false" ]]; then
#     echo "[+] Adding DOT_FOLDER to .env"
#     echo "DOT_FOLDER=$SCRIPT_DIR" >> $HOME/.env
# fi

# Reload shell once installed
echo "[+] Reloading shell..."
echo "[+] Please restart the terminal!"
exec $SHELL -l