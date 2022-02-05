# Windows Development Environment for Software Engineers

How to set up a development environment on Windows 10/11 with docker


# Install Windows Terminal

Open Microsoft Store and search for Terminal and install it

# Install WSL

create a `.wslconfig`

open `C:\Users\<user>\.wslconfig`

and add
```
[wsl2]
memory=2GB
processors=2
```

Open Powershell in Windows Terminal and run the wsl commands

```sh
wsl --install  # Install WSL
wsl --install -d Ubuntu  # Install Ubuntu
wsl --set-version Ubuntu 2 # Set WSL version 2
wsl --setdefault Ubuntu  # Set Ubuntu as the default shell
wsl -l -v  # Check it's set correctly
```

# Configure Windows Terminal

In Windows Terminal press `CTRL`+`,` to open the settings

Set Ubuntu as the default shell in the settings

# Configure WSL

In WSL create `/etc/wsl.conf`

```
[boot]
command = #add a command you want to run at boot
```
> **Note**: The [boot] section only works on Windows 11

Some VPNs require a different MTU size that can be set in the boot command section

```
command = ip link set dev eth0 mtu 1280
```


# WSL welcome message

Silence the welcome message

```sh
touch ~/.hushlogin
```


# Configure SSH

In WSL add a folder in the home directory

```
mkdir ~/.ssh
```

add your public and private SSH key files

and set the access control on the files

```
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa.pub
```

# Install Keychain SSH Agent

In WSL

```sh
sudo apt update
sudo apt install keychain
```

and configure Keychain to start when WSL launches

in `~/.profile` add the following line

```sh
eval `keychain --eval --agents ssh id_rsa`
```

# Install VSCode

Download and install VSCode from [code.visualstudio.com](https://code.visualstudio.com/download)

Open VSCode and install the extension `Remote - WSL` from microsoft

Open the WSL shell and type in

```sh
cd ~ # go to the home folder
code . # run code
```

# Configure bash prompt

Find the PS1 section in `~/.bashrc`

add the git ps1 settings and the PS1 prompt

```sh
GIT_PS1_DESCRIBE_STYLE='contains'
GIT_PS1_SHOWCOLORHINTS='y'
GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWSTASHSTATE='y'
GIT_PS1_SHOWUNTRACKEDFILES='y'
GIT_PS1_SHOWUPSTREAM='auto'

if [ "$color_prompt" = yes ]; then
    PS1='\[\e[0;32m\]\u\[\e[0m\]:\[\e[0;36m\]\w\[\e[0m\]$\[\e[0m\] \[\e[0;33m\]$(__git_ps1)\n\[\e[0m\]λ\[\e[0m\] \[\e[0m\]'
```

> **Note**: the above PS1 setting is a personal preference

# Install Python

## Install Python method 1

```sh
curl https://pyenv.run | bash
```

add the following to `~/.bashrc`
```
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
```
and run
```sh
exec $SHELL
pyenv --version
pyenv install 3.9.10 # or which ever version required
pyenv global 3.9.10
python --version
```

## Install Python method 2
```sh
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.9 # or the version needed
cp /usr/local/bin/python3.9 /usr/local/bin/python
python --version

curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip --version
rm -f get-pip.py
```

# Install Golang

