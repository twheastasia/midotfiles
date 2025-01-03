# midotfiles

## general
* run in bash:
```bash
sudo apt-get update && sudo apt-get install git zsh
git clone https://github.com/twheastasia/midotfiles.git ~/.midotfiles
```
* you should run register function tryLink before you use it:
```bash
tryLink(){
  if [[ -a $2 ]]; then mv -f $2 $2.bak; fi
  ln -s $1 $2
}
```

## [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* run in bash:

```bash
sudo apt-get update && sudo apt-get install git-all
tryLink ~/.midotfiles/gitconfig ~/.gitconfig
tryLink ~/.midotfiles/gitignore ~/.gitignore
```
* you should create ~/.gitconfig.user like
```bash
[user]
  email = aaa@bbb.com
  name = ccc
```

## oh my zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
try_link ~/.midotfiles/zshrc ~/.zshrc

```

## [tmux](https://github.com/tmux/tmux/wiki/Installing)
* run in bash:
```bash
#sudo apt-get update
#sudo apt-get -y install software-properties-common
#sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y tmux
tryLink ~/.midotfiles/tmux.conf ~/.tmux.conf
```

## nvm
* 安装 NVM（Node Version Manager）
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```
Running either of the above commands downloads a script and runs it. The script clones the nvm repository to ~/.nvm, and attempts to add the source lines from the snippet below to the correct profile file (~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc).

```bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```
* 切换npm源
```bash
npm config set registry https://registry.npm.taobao.org
# 还原
npm config set registry https://registry.npmjs.org
```


## [conda](https://docs.anaconda.com/miniconda/install/#quick-command-line-install)
```bash
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
```
After installing, close and reopen your terminal application or refresh it by running the following command:
```bash
source ~/miniconda3/bin/activate
```
To initialize conda on all available shells, run the following command:
```bash
conda init --all
```

## vim
* [安装 neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
* [安装 nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)
* [安装 ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
* 安装 node, 安装 nvm, nvm install 20, 设置 nvm alias default 20, npm install -g yarn
```bash
mkdir -p ~/.config/nvim/init.vim
try_link ~/.midotfiles2/vimrc ~/.config/nvim/init.vim
try_link ~/.config/nvim/init.vim ~/.vimrc
try_link ~/.midotfiles2/coc-settings.json ~/.config/nvim/coc-settings.json

# 安装 nvim 插件
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
vim +PlugInstall +qall
# 升级
vim +PlugUpdate +qall
# 清理
vim +PlugClean +qall

# 安装 autopep8 和 ruff
conda activate base
pip install yapf ruff ruff-lsp
ln -s `which yapf` ~/bin/yapf
ln -s `which ruff` ~/bin/ruff
ln -s `which ruff-lsp` ~/bin/ruff-lsp
conda deactivate

# 安装 coc.nvim 以及插件
cd ~/.vim/bundle/coc.nvim; yarn install --frozen-lockfile
# 参考 vimrc 里面的配置
# vim 里运行 :CocInstall coc-calc coc-diagnostic coc-git coc-json coc-xml coc-yaml coc-pairs coc-lists
# vim 里按需运行 :CocInstall coc-pyright @yaegassy/coc-ruff coc-tsserver coc-solargraph coc-sh coc-docker @yaegassy/coc-nginx coc-markdownlint coc-sql coc-html @yaegassy/coc-tailwindcss3 coc-prettier
# 删除: :CocList extensions, 然后 tab
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

## docker
https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
1. Set up Docker's apt repository.
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

> ### Note
> If you use an Ubuntu derivative distribution, such as Linux Mint, you may need to use UBUNTU_CODENAME instead of VERSION_CODENAME.

2. Install the Docker packages.
To install the latest version, run:

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

3. Verify that the installation is successful by running the hello-world image:

```bash
sudo docker run hello-world
```


## samba

```bash
sudo apt-get install samba
sudo vim /etc/samba/smb.conf
sudo /etc/init.d/smb restart
------
[nfs_share]
  #设置共享目录的路径
  path=/home/twh/share
  browseable=yes
  writable=yes  
  comment=smb share test
  public=yes
  available= yes
  force user = nobody
  force group = nogroup
  #这一行是特别重要的，设置可以被共享访问！！
  guest ok=yes
  create mask = 0775
  directory mask = 0775
```
