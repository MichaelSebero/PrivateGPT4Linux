#!/bin/bash

   git clone https://github.com/imartinez/privateGPT
   cd privateGPT

   poetry install --extras "ui llms-llama-cpp embeddings-huggingface vector-stores-qdrant"

   PGPT_PROFILES=local make setup
   
   cd /home/$USER/privateGPT && PGPT_PROFILES=local make run
