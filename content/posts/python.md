+++
title = "Install Python"
tags = ["programming"]
+++

# Install Python

## Install Python for linux method 1

```sh
curl https://pyenv.run | bash
```

add the following to `~/.bashrc`

```sh
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
```

and run

```sh
exec $SHELL
pyenv --version
pyenv install 3.10.5 # or which ever version required
pyenv global 3.10.5
python --version
```

## Install Python for linux method 2
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
