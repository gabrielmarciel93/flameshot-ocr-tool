#!/bin/bash
export DISPLAY=:0
export XDG_SESSION_TYPE=x11

save_dir="${HOME}/Pictures/ocr"
save_path="${save_dir}/flameshot-screenshot-$(date +%s).png"
mkdir -p "$save_dir"

flameshot gui -r > "$save_path"

[ ! -f "$save_path" ] || [ ! -s "$save_path" ] && exit 1

text="$(tesseract "$save_path" - -l por+eng 2>/dev/null)"

if [ -n "$text" ]; then
    echo "$text"
    echo "$text" | xclip -selection clipboard 2>/dev/null
    notify-send "OCR" "Texto copiado para área de transferência" 2>/dev/null || true
else
    notify-send "OCR" "Nenhum texto reconhecido" 2>/dev/null || true
fi
