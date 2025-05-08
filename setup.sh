#!/bin/bash

# Instalação de dependências
sudo apt-get update
sudo apt-get install -y \
    mininet \
    openvswitch-testcontroller \
    iperf3 \
    ifstat \
    ffmpeg \
    xterm \
    tshark \
    bwm-ng \
    python3-pip \
    git

# Configuração do ambiente gráfico (opcional para Codespaces)
xhost +SI:localuser:root

# Baixar vídeo de exemplo
wget https://download.blender.org/durian/trailer/sintel_trailer-480p.mp4 -O video.mp4

# Criar estrutura de diretórios
mkdir -p {results,logs,qos_configs}

# Configura o Xvfb (display virtual)
Xvfb :1 -screen 0 1024x768x16 -ac -nolisten tcp &
export DISPLAY=:1

# Permite acesso do root ao servidor gráfico
xhost +SI:localuser:root

# Configura PulseAudio (somente se usar áudio)
pulseaudio --start --exit-idle-time=-1

# Cria diretório temporário para X11 (evita erros)
sudo mkdir -p /tmp/.X11-unix && sudo chmod 1777 /tmp/.X11-unix

# Verifica versões (opcional)
ffmpeg -version | head -n 1
ffplay -version | head -n 1