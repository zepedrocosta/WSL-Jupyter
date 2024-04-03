#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW="\033[0;33m"
CYAN="\033[0;36m"
NC='\033[0m' # No Color

# Run update and upgrade
echo -e "${YELLOW}Running sudo apt update && upgrade...${NC}"
sudo apt update && sudo apt upgrade

# Check if python3 is installed
echo -e "${CYAN}Checking if python3 is installed...${NC}"
if ! command -v python3 &> /dev/null; then
    echo "${YELLOW}Installing python3...${NC}"
    sudo apt install python3
else
    echo -e "${GREEN}python3 is already installed.${NC}"
fi

# Check if python3-pip is installed
echo -e "${CYAN}Checking if python3-pip is installed...${NC}"
if ! command -v pip3 &> /dev/null; then
    echo "${YELLOW}Installing python3-pip...${NC}"
    sudo apt install python3-pip
else
    echo -e "${GREEN}python3-pip is already installed.${NC}"
fi

# Check if ipython3 is installed
echo -e "${CYAN}Checking if ipython3 is installed...${NC}"
if ! command -v ipython3 &> /dev/null; then
    echo "${YELLOW}Installing ipython3...${NC}"
    sudo apt install ipython3
else
    echo -e "${GREEN}ipython3 is already installed.${NC}"
fi

# Check if Jupyter is installed
echo -e "${CYAN}Checking if Jupyter is installed...${NC}"
if ! command -v jupyter &> /dev/null; then
    echo "${YELLOW}Installing Jupyter...${NC}"
    sudo pip3 install jupyter
else
    echo -e "${GREEN}Jupyter is already installed.${NC}"
fi

# Install requirements.txt if it exists
if [ -f "requirements.txt" ]; then
    echo -e "${YELLOW}Installing packages from requirements.txt...${NC}"
    sudo pip3 install -r requirements.txt

    echo -e "${CYAN}Checking if packages were installed successfully...${NC}"
    while IFS= read -r package
    do
        if ! pip3 freeze | grep -q "$package"; then
            echo -e "${RED}$package not installed successfully.${NC}"
            exit 1
        fi
    done < requirements.txt
    echo -e "${GREEN}All packages were installed successfully!!${NC}"
else
    echo -e "${RED}requirements.txt file not found. Skipping installation.${NC}"
fi

echo -e "${GREEN}All required packages are installed successfully.${NC}"