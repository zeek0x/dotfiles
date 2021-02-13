#!/bin/bash

cd "$(dirname "$0")" && . ./util.sh

case $(os) in
  darwin )
    fonts_dir="$HOME/Library/Fonts" ;;
  ubuntu )
    fonts_dir="$HOME/.local/share/fonts" ;;
esac

mkdir -p "$fonts_dir"

for type in Bold Light Medium Regular Retina
do
  file_path="$fonts_dir/FiraCode-$type.ttf"
  file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-$type.ttf?raw=true"
  curl -Lo "$file_path" "$file_url"
done

curl -L https://raw.githubusercontent.com/powerline/fonts/master/install.sh | bash
