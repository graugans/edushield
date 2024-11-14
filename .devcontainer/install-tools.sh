#!/bin/bash

# Update package lists
sudo apt-get update

# Install tools and libraries for the picotool needed to flash the Raspberry Pi Pico
sudo apt install -y build-essential \
                    pkg-config \
                    libusb-1.0-0-dev \
                    gcc-arm-none-eabi \
                    libnewlib-arm-none-eabi \
                    libstdc++-arm-none-eabi-newlib


# Get the current user's ID and group ID
USER_ID=$(id -u)
GROUP_ID=$(id -g)

# 
sudo mkdir -p /opt
sudo chown -R $USER_ID:$GROUP_ID /opt

# Install the STM32CubeF1 project
git clone --recursive  --depth 1 --branch v1.8.6 https://github.com/STMicroelectronics/STM32CubeF1.git /opt/STM32CubeF1

