#!/usr/bin/env bash
#
# flameshot-ocr-tool
# Instalacao automatizada para qualquer distribuicao Linux
#

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[INFO]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

[ "$(id -u)" -eq 0 ] && { error "Nao execute como root. O script usara sudo quando necessario."; exit 1; }
[ "$(uname)" != "Linux" ] && { error "Apenas Linux."; exit 1; }

info "Detectando distribuicao..."

if command -v apt &>/dev/null; then
    INSTALL_CMD="sudo apt install -y"
    PACKAGES="flameshot tesseract-ocr tesseract-ocr-por tesseract-ocr-eng xclip libnotify-bin"
elif command -v dnf &>/dev/null; then
    INSTALL_CMD="sudo dnf install -y"
    PACKAGES="flameshot tesseract tesseract-langpack-por tesseract-langpack-eng xclip libnotify"
elif command -v pacman &>/dev/null; then
    INSTALL_CMD="sudo pacman -S --noconfirm"
    PACKAGES="flameshot tesseract tesseract-data-por tesseract-data-eng xclip libnotify"
elif command -v zypper &>/dev/null; then
    INSTALL_CMD="sudo zypper install -y"
    PACKAGES="flameshot tesseract-ocr tesseract-ocr-traineddata-english tesseract-ocr-traineddata-portuguese xclip libnotify-tools"
else
    error "Gerenciador de pacotes nao reconhecido (apt/dnf/pacman/zypper)."
    error "Instale manualmente: flameshot, tesseract (por+eng), xclip, notify-send"
    exit 1
fi

info "Instalando dependencias..."
$INSTALL_CMD $PACKAGES

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST_DIR="$HOME/bin"
mkdir -p "$DEST_DIR"

for script in flameshot.sh flameshot-ocr.sh; do
    if [ -f "$DEST_DIR/$script" ]; then
        warn "$DEST_DIR/$script ja existe. Substituindo..."
    fi
    cp "$SCRIPT_DIR/$script" "$DEST_DIR/$script"
    chmod +x "$DEST_DIR/$script"
    info "Instalado: $DEST_DIR/$script"
done

if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    warn "$HOME/bin nao esta no PATH."
    echo '  Adicione ao ~/.bashrc:  export PATH="$HOME/bin:$PATH"'
fi

echo
info "Instalacao concluida!"
echo
echo "  flameshot.sh     -> print normal"
echo "  flameshot-ocr.sh -> print + OCR (portugues/ingles)"
echo
echo "Para atalhos de teclado:"
echo "  Configuracoes -> Teclado -> Atalhos -> Adicionar"
echo "    Comando: /home/$USER/bin/flameshot.sh"
echo "    Comando: /home/$USER/bin/flameshot-ocr.sh"
echo
