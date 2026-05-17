#!/usr/bin/env bash

set -e

echo "Removendo scripts..."
for file in flameshot.sh flameshot-ocr.sh; do
    for dir in /usr/local/bin ~/bin ~/.local/bin; do
        [ -f "$dir/$file" ] && rm -v "$dir/$file" 2>/dev/null || true
    done
done

echo
echo "Scripts removidos."
echo "Para remover pacotes instalados:"
echo "  sudo apt remove --purge flameshot tesseract-ocr tesseract-ocr-por tesseract-ocr-eng xclip libnotify-bin"
