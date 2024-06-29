#!/bin/bash

git clone https://github.com/zylon-ai/private-gpt
cd private-gpt


curl https://pyenv.run | bash
export PATH="/home/user/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

pyenv install 3.11
pyenv local 3.11

curl -sSL https://install.python-poetry.org | python3.11 -


poetry install --extras "ui llms-ollama embeddings-ollama vector-stores-qdrant"

ollama pull mistral
ollama pull nomic-embed-text
ollama serve

PGPT_PROFILES=ollama make run
