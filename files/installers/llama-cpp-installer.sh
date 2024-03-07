#!/bin/bash

echo "1. Lower-End-Hardware"
echo "2. Higher-End-Hardware"
read -p "Enter your choice (1 or 2): " choice

if [ "$choice" = "1" ]; then
   git clone https://github.com/imartinez/privateGPT
   cd privateGPT

   poetry install --extras "ui llms-llama-cpp embeddings-huggingface vector-stores-qdrant"

   curl -LO https://raw.githubusercontent.com/MichaelSebero/PrivateGPT4Linux/main/files/lower-end-hardware/settings.yaml

   curl -LO https://raw.githubusercontent.com/MichaelSebero/PrivateGPT4Linux/main/files/lower-end-hardware/settings-local.yaml

   PGPT_PROFILES=local make setup
   
elif [ "$choice" = "2" ]; then
   git clone https://github.com/imartinez/privateGPT
   cd privateGPT

   poetry install --extras "ui llms-llama-cpp embeddings-huggingface vector-stores-qdrant"

   curl -LO https://raw.githubusercontent.com/MichaelSebero/PrivateGPT4Linux/main/files/higher-end-hardware/settings.yaml

   curl -LO https://raw.githubusercontent.com/MichaelSebero/PrivateGPT4Linux/main/files/higher-end-hardware/settings-local.yaml

   PGPT_PROFILES=local make setup
fi   
