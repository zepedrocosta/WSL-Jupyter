#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Run update and upgrade
echo -e "${GREEN}Running sudo apt update && upgrade...${NC}"
sudo apt update && sudo apt upgrade

# Install necessary packages
echo "Installing python3, python3-pip, and ipython3..."
sudo apt install python3 python3-pip ipython3

# Install python3-pip if not installed already
echo "Installing python3-pip if not installed..."
sudo apt install python3-pip

# Check if python3 is installed
echo -e "${GREEN}Checking if python3 is installed...${NC}"
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}python3 is not installed. Aborting script.${NC}"
    exit 1
fi

# Check if python3-pip is installed
echo -e "${GREEN}Checking if python3-pip is installed...${NC}"
if ! command -v pip3 &> /dev/null; then
    echo -e "${RED}python3-pip is not installed. Aborting script.${NC}"
    exit 1
fi

# Check if ipython3 is installed
echo -e "${GREEN}Checking if ipython3 is installed...${NC}"
if ! command -v ipython3 &> /dev/null; then
    echo -e "${RED}ipython3 is not installed. Aborting script.${NC}"
    exit 1
fi

# Install Jupyter
echo -e "${GREEN}Installing Jupyter...${NC}"
sudo pip3 install jupyter

# Check if Jupyter is installed
echo -e "${GREEN}Checking if Jupyter is installed...${NC}"
if ! command -v jupyter &> /dev/null; then
    echo -e "${RED}Jupyter is not installed. Aborting script.${NC}"
    exit 1
fi

echo -e "${GREEN}All required packages are installed successfully.${NC}"