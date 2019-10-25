# midotfiles

## general
* run in bash:
```
sudo apt-get update && sudo apt-get install git
git clone https://github.com/chenmi319/midotfiles.git ~/.midotfiles
```
* you should run register function tryLink before you use it:
```
tryLink(){
  if [[ -a $2 ]]; then mv -f $2 $2.bak; fi
  ln -s $1 $2
}
```

## git
* run in bash:
```
tryLink ~/.midotfiles/gitconfig ~/.gitconfig
tryLink ~/.midotfiles/gitignore ~/.gitignore
```
* you should create ~/.gitconfig.user like
```
[user]
  email = aaa@bbb.com
  name = ccc
```

## tmux
* run in bash:
```
sudo apt-get update
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y tmux
tryLink ~/.midotfiles/tmux.conf ~/.tmux.conf
tryLink ~/.midotfiles/tmux-osx.conf ~/.tmux-osx.conf
```


## vim
* install vim 8.0+
```
sudo apt install software-properties-common
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
########## 删除
sudo apt remove vim
sudo add-apt-repository --remove ppa:jonathonf/vim
```
* run in bash:

http://swiftsignal.com/packages/ubuntu/quantal/the-silver-searcher_0.14-1_amd64.deb
```
sudo apt-get install silversearcher-ag vim-nox ctags
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
tryLink ~/.midotfiles/vimrc ~/.vimrc
vim +PluginInstall +qall
```
* for syntastic check: js can `npm install -g jshint`, yml can `gem install haml`, and etc.

## zprezto 
* run in bash:
```
sudo apt-get install zsh
```
* run in zsh:
```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
tryLink ~/.midotfiles/prompt_chenmi_setup ~/.zprezto/modules/prompt/functions/prompt_chenmi_setup
tryLink ~/.midotfiles/zpreztorc ~/.zprezto/runcoms/zpreztorc
tryLink ~/.midotfiles/zshrc ~/.zprezto/runcoms/zshrc
```
* run zsh and if everything works well, 'chsh -s /bin/zsh' or 'sudo vipw' to edit your default shell to /bin/zsh
* PROMPT=$'%{$fg[cyan]%}%* %D%{$reset_color%}|%{$fg[white]%}%U%n%u@%U%m%u%{$reset_color%}|%{$fg[yellow]%}D:%B%~%b >>> %{$reset_color%}\n%# '

## oh my zsh
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## bash bashit(for develop)
* run in bash:
```
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
 ~/.bash_it/install.sh
```
* relogin and run in bash:
```
bash-it enable completion bundler capistrano rake ssh tmux
bash-it enable plugin git git-subrepo history nginx rails ruby rvm ssh tmux
bash-it enable alias git rails tmux vim
echo "\nexport VISUAL=vim\nexport EDITOR=\"\$VISUAL\"\n" >> ~/.bashrc
```
* relogin

## bash liquid(for server)
* run in bash:
```
git clone https://github.com/nojhan/liquidprompt.git ~/.liquidprompt
echo '[[ $- = *i* ]] && source ~/.liquidprompt/liquidprompt' >> ~/.bashrc
tryLink ~/.midotfiles/liquidpromptrc ~/.liquidpromptrc
```
* relogin

## solarized dark
* run in bash
```
tryLink ~/.midotfiles/dircolors.256dark ~/.dir_colors
```



## python
python get-pip.py
(wget https://bootstrap.pypa.io/get-pip.py)

## nvm
#### Install script
```
To install or update nvm, you can use the install script using cURL:
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

or Wget:
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
```
https://github.com/creationix/nvm/blob/master/README.md

## rvm
#### Install RVM:
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
```
http://www.rvm.io/


## owncloud

## Aria2
```
sudo apt-get install aria2
sudo mkdir /etc/aria2    #新建文件夹  
sudo touch /etc/aria2/aria2.session    #新建session文件
sudo chmod 777 /etc/aria2/aria2.session    #设置aria2.session可写 
#创建配置文件,修改其中的下载目录
tryLink ~/.midotfiles/aria2.conf /etc/aria2/aria2.conf

#后台启动aria2 
sudo aria2c --conf-path=/etc/aria2/aria2.conf -D
```

## frp

```
https://github.com/fatedier/frp/blob/master/README_zh.md
```

## nginx


## docker
https://docs.docker-cn.com/engine/installation/linux/docker-ce/ubuntu/#%E4%BD%BF%E7%94%A8%E9%95%9C%E5%83%8F%E4%BB%93%E5%BA%93%E8%BF%9B%E8%A1%8C%E5%AE%89%E8%A3%85
```
curl -sSL https://get.docker.com | sh

or

sudo apt-get update

sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common
     
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
```

