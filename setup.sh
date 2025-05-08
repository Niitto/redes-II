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