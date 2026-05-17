# flameshot-ocr-tool

Ferramenta Linux para captura de tela com OCR integrado (português e inglês).

## Scripts

| Comando | Descrição |
|---------|-----------|
| `flameshot.sh` | Apenas prints normais (captura e salva a imagem manualmente) |
| `flameshot-ocr.sh` | Extrai texto de imagens com OCR (português/inglês) e copia para área de transferência |

## Instalação

```bash
cd flameshot-ocr-tool
./install.sh
```

O instalador detecta sua distribuição (Ubuntu, Fedora, Arch, openSUSE),
instala as dependências e copia os scripts para `~/bin/`.

## Atalho de teclado

1. Configurações do sistema → Teclado → Atalhos → Adicionar
2. Comando: `/home/seu usuario/bin/flameshot.sh` ou `flameshot-ocr.sh`

## Como funciona

```
flameshot.sh (prints normais):
  flameshot gui → seleciona a área → salva a imagem manualmente

flameshot-ocr.sh (extrair texto de imagem):
  flameshot gui → seleciona a área
  → tesseract OCR (português + inglês)
  → texto copiado para área de transferência
  → notificação
```

## Dependências

- flameshot (captura de tela)
- tesseract-ocr + idiomas por/eng (reconhecimento de texto)
- xclip (área de transferência)
- libnotify (notificações)

## Desinstalação

```bash
./uninstall.sh
```
