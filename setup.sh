#!/bin/bash

install_ubuntu() {
    sudo apt update
    sudo apt install -y $1
}

install_macos() {
    brew install $1
}

install_ohmyzsh() {
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_fonts_ubuntu() {
    mkdir -p ~/.fonts
    cp -r $1 ~/.fonts
    fc-cache -fv
}

install_fonts_macos() {
    cp -r $1 ~/Library/Fonts/
}

download_and_install_fonts() {
    echo "Downloading and installing Hack Nerd Font..."
    curl -Lo "$HOME/.config/nvim/Hack.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip"
    unzip "$HOME/.config/nvim/Hack.zip" -d "$HOME/.config/nvim"
    $install_fonts_cmd "$HOME/.config/nvim/*.ttf"
    rm -rf $HOME/.config/nvim/*.ttf
    rm -rf $HOME/.config/nvim/*.md
    rm -rf "$HOME/.config/nvim/Hack.zip"
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="Ubuntu"
    install_cmd=install_ubuntu
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macOS"
    install_cmd=install_macos
else
    echo "Unsupported OS."
    exit 1
fi

echo "Detected OS: $OS"

echo "Copying files to ~/.config/nvim..."
mkdir -p ~/.config/nvim
cp -r $(ls | grep -vE '\.sh$|^\..*') ~/.config/nvim

for pkg in nvim rg zsh; do
    if ! command -v $pkg &> /dev/null; then
        read -p "$pkg is not installed. Would you like to install it? (y/n) " yn
        if [[ $yn == [Yy]* ]]; then
            $install_cmd $pkg
        fi
    fi
done

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    read -p "Oh My Zsh is not installed. Would you like to install it? (y/n) " yn
    if [[ $yn == [Yy]* ]]; then
        install_ohmyzsh
    fi
fi

download_and_install_fonts

echo "Setup completed successfully."

