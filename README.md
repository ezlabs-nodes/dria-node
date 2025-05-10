#  Dria Node Incentivized Tutorial: Easy Setup with Automated Script

## Quick Start Guide

### Step 1️⃣: Automated Installation
````bash
wget -q https://raw.githubusercontent.com/waults/dria-node/main/install.sh && chmod +x install.sh && ./install.sh
````
### Step 2️⃣: Create a Screen Session and Start Node
````
screen -S dria
dkn-compute-launcher start
````
🔹 You'll be prompted to enter your DKN wallet Secret Key (MetaMask private key without the 0x prefix)
Step 3️⃣: Select Your AI Model
Choose from supported models:

#### `ollama` (Self-hosted)

#### `openai` (API-based)

#### `gemini` (Google's AI)

##### `openrouter` (Aggregated APIs)

📌 Hardware Requirements:
Node Specifications
https://github.com/firstbatchxyz/dkn-compute-node/blob/master/docs/NODE_SPECS.md

#### Step 4️⃣: Verify Ollama Status (If Used)
````
sudo systemctl status ollama
````
📊 Track Your Progress
Monitor your node's performance:
Dria Leaderboard
https://dria.co/edge-ai

#### 🛑 Stopping the Dria Node
````
dkn-compute-launcher stop
````
#### 2. Emergency Stop (if unresponsive)
````
pkill -f "dkn-compute-launcher"
screen -XS dria quit
````
#### 3. Verification
````
pgrep -f "dkn-compute-launcher" || echo "✅ Node stopped successfully"
````
