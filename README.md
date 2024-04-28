## How to Install

. Install `python-poetry` and `pyenv`

. Run the corresponding commands below.

### LLaMA-CPP Version (RECOMMENDED)
```
curl -LO https://raw.githubusercontent.com/MichaelSebero/PrivateGPT4Linux/main/files/installers/llama-cpp-installer.sh

sh llama-cpp-installer.sh
```

### Ollama Version
```
curl -LO https://raw.githubusercontent.com/MichaelSebero/PrivateGPT4Linux/main/files/installers/ollama-installer.sh

sh ollama-installer.sh
```

## How to Use

### LLaMA-CPP
```
cd /home/$USER/privateGPT && PGPT_PROFILES=local make run
```

### Ollama
```
cd /home/$USER/privateGPT && PGPT_PROFILES=ollama make run
```

- Enter `localhost:8001` in your browser, despite it being ran in your browser privateGPT is offline.

## Supported File Formats to Ingest

- `.csv`: CSV (Comma-Separated Values)
- `.docx`: Word Document
- `.epub`: EPub (Electronic Publication)
- `.hwp`: HWP (Hancom Writer)
- `.ipynb`: Jupyter Notebook
- `.jpg`: JPEG Image
- `.json`: JSON (JavaScript Object Notation)
- `.jpeg`: JPEG Image
- `.md`: Markdown
- `.mbox`: Mbox (Mailbox)
- `.mp3`: MP3 Audio
- `.mp4`: MP4 Video
- `.pdf`: Portable Document Format (PDF)
- `.png`: PNG Image
- `.ppt`: PowerPoint Document
- `.pptm`: PowerPoint Document (Macro-Enabled)
- `.pptx`: PowerPoint Document
   
## How to Change the Model

### LLaMA-CPP

. Edit the section below in `settings.yaml` and `settings-local.yaml`

```
llamacpp:
  prompt_style: "llama2"
  llm_hf_repo_id: TheBloke/Nous-Hermes-Llama2-GGUF | This is where it looks to find the repo.
  llm_hf_model_file: nous-hermes-llama2-13b.Q5_K_S.gguf | This is where it looks to find a specific file in the repo.
```
> [ prompt_style ] should be 'default', 'llama2', 'tag', 'mistral' or 'chatml'

. Change the tokenizer section in `settings-local.yaml`

```
llm:
  mode: llamacpp
  # Should be matching the selected model
  max_new_tokens: 4096
  context_window: 3900
  tokenizer: NousResearch/Nous-Hermes-Llama2-13b | Change this to where the model file is located.
```
> You might have to modify [ max_new_tokens ] to match the model's max tokens.

. Delete the contents of `/home/$USER/privateGPT/models`

. Run the commands below. 

```
/home/$USER/privateGPT && PGPT_PROFILES=local make setup
```

## Documentation 

https://docs.privategpt.dev/manual
