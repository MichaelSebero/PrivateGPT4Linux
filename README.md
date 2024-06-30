## How to Install

. Install `python-poetry` and `pyenv`

### . Run the corresponding commands below.
```
curl -LO https://raw.githubusercontent.com/MichaelSebero/PrivateGPT4Linux/main/files/installers/llama-cpp-installer.sh

sh llama-cpp-installer.sh
```

## How to Launch PrivateGPT
```
cd /home/$USER/private-gpt && poetry env use /home/user/.pyenv/versions/3.11.9/bin/python3.11 && PGPT_PROFILES=local poetry run make run
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

. Edit the section below in `settings.yaml` and `settings-local.yaml`

```
llamacpp:
  llm_hf_repo_id: Repo-User/Language-Model-GGUF | This is where it looks to find the repo.
  llm_hf_model_file: language-model-file.gguf | This is where it looks to find a specific file in the repo.
```

. Change the tokenizer section in `settings-local.yaml`

```
llm:
  mode: llamacpp
  # Should be matching the selected model
  max_new_tokens: 512
  context_window: 3900
  tokenizer: Repo-User/Language-Model | Change this to where the model file is located.
  prompt_style: "default" | Change this if required.
```
> You might have to modify [ max_new_tokens ] to match the model's max tokens.

> [ prompt_style ] should be 'default', 'llama2', 'tag', 'mistral' or 'chatml'

. Delete the contents of `/home/$USER/private-gpt/models`

. Launch PrivateGPT.

## Documentation 

https://docs.privategpt.dev/manual
