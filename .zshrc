# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh

# ZPLUG
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# >  History config
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# > zsh插件
# plugins=()

# > zplug 安装插件
# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# Supports oh-my-zsh plugins and the like
# zplug "plugins/git",   from:oh-my-zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Load theme file
# zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

# starship init
eval "$(starship init zsh)"

# gpg commit
export GPG_TTY=$(tty)

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# alias openwechat="nohup /Applications/WeChat.app/Contents/MacOS/WeChat > /tmp/wechat.txt 2>&1 &"
alias tf="terraform"
alias k="kubectl"

# awscli completion
# complete -C '/usr/local/bin/aws_completer' aws

# terraform completion
complete -o nospace -C /usr/local/bin/terraform terraform

# kubectl helm completion
source <(kubectl completion zsh)
source <(helm completion zsh)

# Go envs
export GOVERSION=go1.17.6 # Go 版本设置
export GO_INSTALL_DIR=$HOME/go # Go 安装目录
export GOROOT=$GO_INSTALL_DIR/$GOVERSION # GOROOT 设置
export GOPATH=$GO_INSTALL_DIR/golang # GOPATH 设置
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH # 将 Go 语言自带的和通过 go install 安装的二进制文件加入到 PATH 路径中
# export GO111MODULE="on" # 开启 Go moudles 特性
# export GOPROXY=https://goproxy.cn,direct # 安装 Go 模块时，代理服务器设置
# export GOPRIVATE=
# export GOSUMDB=off # 关闭校验 Go 依赖包的哈希值

# direnv
eval "$(direnv hook zsh)"
