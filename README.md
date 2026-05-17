# flameshot-ocr-tool

Ferramenta Linux para captura de tela com OCR integrado (português e inglês).

## Scripts

| Comando | Descrição |
|---------|-----------|
| `flameshot.sh` | Abre o flameshot para captura de tela normal |
| `flameshot-ocr.sh` | Captura a tela, reconhece o texto e copia para área de transferência |

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
flameshot.sh:         flameshot gui → seleciona área → salva manualmente

flameshot-ocr.sh:     flameshot gui → seleciona área
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
