---
title: Python
icon: fontawesome/brands/python
hide:
  - toc
---

# Install Python

## Using uv

```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
uv init myproject
cd myproject
uv run python
```

## Using apt

```sh
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.10 # or the version needed
cp /usr/local/bin/python3.10 /usr/local/bin/python
python --version

curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip --version
rm -f get-pip.py
```
