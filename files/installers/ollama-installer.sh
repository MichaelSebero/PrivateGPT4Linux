#!/bin/bash

# Step 1: Clone the PrivateGPT repository
echo "Cloning PrivateGPT repository..."
git clone https://github.com/imartinez/privateGPT
cd privateGPT

# Step 2: Install Python 3.11 using pyenv
echo "Installing Python 3.11..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "OSX detected. Installing pyenv..."
    brew install pyenv
    pyenv install 3.11
    pyenv local 3.11
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux detected. Installing pyenv..."
    curl https://pyenv.run | bash
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    pyenv install 3.11
    pyenv local 3.11
else
    echo "Unsupported OS. Exiting."
    exit 1
fi

# Step 3: Install Ollama
echo "Installing Ollama..."
# Visit ollama.ai and follow the instructions manually

# Step 4: Start Ollama service in the background as a daemon
echo "Starting Ollama service in the background as a daemon..."
nohup env OLLAMA_HOST=0.0.0.0:11434 ollama serve &

# Wait for Ollama to start
echo "Waiting for Ollama to start..."
sleep 10

# Step 5: Pull Ollama models
echo "Pulling Ollama models..."
ollama pull mistral
ollama pull nomic-embed-text

# Step 6: Install PrivateGPT with poetry
echo "Installing PrivateGPT with poetry..."
poetry install --extras "ui llms-ollama embeddings-ollama vector-stores-qdrant"

# Step 7: Run PrivateGPT
echo "Running PrivateGPT..."
PGPT_PROFILES=ollama make run
