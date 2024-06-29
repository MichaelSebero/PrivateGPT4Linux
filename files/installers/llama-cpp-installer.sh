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

poetry install --extras "ui llms-llama-cpp embeddings-huggingface vector-stores-qdrant"

poetry run python scripts/setup

PGPT_PROFILES=local make run
