#!/bin/bash 

# Define color codes
INFO='\033[0;36m'  # Cyan
BANNER='\033[0;35m' # Magenta
YELLOW='\033[0;33m' # Yellow
RED='\033[0;31m'    # Red
GREEN='\033[0;32m'  # Green
BLUE='\033[0;34m'   # Blue
NC='\033[0m'        # No Color

# Display social details and channel information in large letters manually
echo "========================================"
echo -e "${YELLOW} Script is made by EZ-LABS${NC}"
echo -e "-------------------------------------"

# Print EZ LABS ASCII art
echo -e "${BLUE}"
echo -e " ███████╗███████╗     ██╗      █████╗ ██████╗ ███████╗"
echo -e " ██╔════╝╚══███╔╝     ██║     ██╔══██╗██╔══██╗██╔════╝"
echo -e " █████╗    ███╔╝█████╗██║     ███████║██████╔╝███████╗"
echo -e " ██╔══╝   ███╔╝ ╚════╝██║     ██╔══██║██╔══██╗╚════██║"
echo -e " ███████╗███████╗     ███████╗██║  ██║██████╔╝███████║"
echo -e " ╚══════╝╚══════╝     ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝"
echo -e "${NC}"

# Print decorative border
echo -e "${PURPLE}╭───────────────────────────────────────────────────────╮${NC}"

# Print tagline with color effects
echo -e "${CYAN}│  ${YELLOW}⚡ ${WHITE}S i m p l i f y i n g   D e v e l o p m e n t ${YELLOW}⚡  ${CYAN}│${NC}"

# Print bottom border
echo -e "${PURPLE}╰───────────────────────────────────────────────────────╯${NC}"

# Print additional info
echo -e "\n${GREEN}🚀 Node.js Tools  •  ${RED}Linux Automation  •  ${BLUE}Cloud Solutions${NC}\n"

echo -e "${YELLOW}Telegram: ${GREEN}https://t.me/EzLabsNodes${NC}"
echo -e "${YELLOW}Twitter: ${GREEN}@EzlabsNodes${NC}"
echo "======================================================="

# Update package lists and upgrade installed packages
echo -e "${YELLOW}Updating and upgrading system packages...${NC}"
sudo apt update -y && sudo apt upgrade -y

# Check if Docker is already installed
if command -v docker &> /dev/null; then
    echo -e "${YELLOW}Docker is already installed, skipping Docker installation.${NC}"
else
    # Install dependencies for Docker installation
    echo -e "${YELLOW}Installing required dependencies for Docker...${NC}"
    sudo apt install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common \
      lsb-release \
      gnupg2

    # Add Docker's official GPG key
    echo -e "${YELLOW}Adding Docker's official GPG key...${NC}"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Add Docker repository
    echo -e "${YELLOW}Adding Docker repository...${NC}"
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update package lists to include Docker's repository
    echo -e "${YELLOW}Updating package lists...${NC}"
    sudo apt update -y

    # Install Docker
    echo -e "${YELLOW}Installing Docker...${NC}"
    sudo apt install -y docker-ce docker-ce-cli containerd.io

    # Check if Docker is installed successfully
    if ! command -v docker &> /dev/null; then
        echo -e "${RED}Docker installation failed!${NC}"
        exit 1
    else
        echo -e "${YELLOW}Docker is successfully installed!${NC}"
    fi
fi

# Check if Docker Compose is already installed
if command -v docker-compose &> /dev/null; then
    echo -e "${YELLOW}Docker Compose is already installed, skipping Docker Compose installation.${NC}"
else
    echo -e "${YELLOW}Docker Compose not found. Installing Docker Compose...${NC}"
    VER=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
    curl -L "https://github.com/docker/compose/releases/download/$VER/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    echo -e "${YELLOW}Docker Compose has been installed!${NC}"
fi

# Add current user to Docker group
if ! groups $USER | grep -q '\bdocker\b'; then
    echo "Adding user to Docker group..."
    sudo groupadd docker
    sudo usermod -aG docker $USER
else
    echo "User is already in the Docker group."
fi

# Install Screen if not installed
if command -v screen &> /dev/null; then
    echo -e "${YELLOW}Screen is already installed, skipping installation.${NC}"
else
    echo -e "${YELLOW}Screen is not installed. Installing Screen...${NC}"
    sudo apt install -y screen
fi

# Install Unzip
echo -e "${YELLOW}Installing Unzip...${NC}"
sudo apt install -y unzip

# Install Ollama
echo -e "${YELLOW}Installing Ollama...${NC}"
curl -fsSL https://ollama.com/install.sh | sh

# Check Ollama version
echo -e "${YELLOW}Ollama version:${NC}"
ollama --version

# Start Ollama service
echo -e "${YELLOW}Starting Ollama service...${NC}"
ollama start &

# Pull Ollama models
echo -e "${YELLOW}Pulling Ollama models...${NC}"
ollama pull hellord/mxbai-embed-large-v1:f16
ollama pull llama3.1:latest
ollama pull llama3.2:1b

# Install DKN Compute Node
echo -e "${YELLOW}Installing DKN Compute Node...${NC}"
cd "$HOME"
curl -fsSL https://dria.co/launcher | bash

echo -e "${YELLOW}Installation completed.${NC}"

echo "==================================="
echo -e "${BANNER}           EZ Labs Nodes       ${NC}"
echo "==================================="
echo -e "${GREEN}    Thanks for using this script!${NC}"
echo "==================================="
