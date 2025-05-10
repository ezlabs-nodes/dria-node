Update Dria Node Incentivized Tutorial: Easy Setup with Automated Script 🚀

Step 1️⃣: Execute the below-automated script
wget -q https://raw.githubusercontent.com/waults/dria-node/refs/heads/main/install.sh && chmod +x install.sh && ./install.sh

Step 2️⃣: Create a screen
screen -S dria

Let’s Run Dria Node:
dkn-compute-launcher start

Once executed, it will prompt you to enter your DKN wallet Secret Key (your MetaMask private key without the 0x).

Step 3️⃣ :  Select your models :
- ollama
- openai
- gemini
- openrouter
To learn about hardware specifications such as required CPU and RAM, please refer to node specifications here (https://github.com/firstbatchxyz/dkn-compute-node/blob/master/docs/NODE_SPECS.md).

Step 4️⃣ :  Check Ollama Status
sudo systemctl status ollama

Check your Point/Step here: https://steps.leaderboard.dria.co/
