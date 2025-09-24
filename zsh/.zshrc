# local bin folder
export PATH=$PATH:/home/kerwood/.local/bin

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kerwood/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Do not append to history if the command starts with a space
HIST_IGNORE_SPACE="true"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo gcloud kubectl docker aws)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Ansible
alias ansible='podman run --rm -it -v $(pwd):/ansible/playbooks:Z -v ~/.ssh:/root/.ssh:Z --entrypoint=ansible ansible'
alias ansible-playbook='podman run --rm -it -v $(pwd):/ansible/playbooks:Z -v ~/.ssh:/root/.ssh:Z  ansible'

# WMWare PowerCLI
alias powercli='podman run --rm -v powercli:/root:Z -it vmware/powerclicore'

# Digital Ocean
alias do-create-droplet='doctl compute droplet create --size s-1vcpu-1gb --image centos-stream-9-x64 --region ams3 --ssh-keys 39:e5:cb:0c:6b:fa:ab:5b:03:be:42:6d:86:4b:ec:d5 --wait'
alias do-delete-droplet='doctl compute droplet delete'
alias getspid='az ad sp list --query "[].appId" -o tsv --display-name'

# eza - ls replacement
alias ls="eza"
alias ll="eza --icons --git --header --group-directories-first -l"
alias l="eza --icons --git --header --group-directories-first -l"

# Kubectl tree
alias kti="kubectl tree ingresses.v1.networking.k8s.io"
alias ktd="kubectl tree deployments.apps"
alias ktc="kubectl tree certificates.cert-manager.io"

# Misc
alias dc='docker compose'
# Will print our structed JSON and any other non JSON lines in between.
alias pjson="jq -R -r -C '. as \$line | try fromjson catch \$line'"
# Will only print valid JSON.
alias fjson="jq -R 'try fromjson catch empty'"
alias cat='bat -p'
alias remove-branches='git branch | xargs -L1 | gum choose --no-limit | xargs git branch -D'
alias watch="watch "
alias fix-chrome="rm -rf ~/.config/google-chrome/Singleton*"
alias xclip="xclip -selection clipboard"
alias ok='cd ~/kubernetes/$(eza -D ~/kubernetes | fzf --border || true)'
alias og=open_git
alias au='unset AWS_PROFILE'
alias al='aws sso login --profile iam'
alias ap=aws_profile
alias adl=aws_docker_login

function aws_docker_login() {
  aws ecr get-login-password --region eu-central-1 --profile shared-non-production | docker login --username AWS --password-stdin 730335548317.dkr.ecr.eu-central-1.amazonaws.com
  aws ecr get-login-password --region eu-central-1 --profile shared-production | docker login --username AWS --password-stdin 533267182897.dkr.ecr.eu-central-1.amazonaws.com
}

function aws_profile() {
  local p=$(cat $HOME/.aws/config | awk -F' ' '/^\[profile/ {print $2}' | tr -d '[]' | fzf)
  export AWS_PROFILE=$p
}

function open_git() {
  local g_dir="$HOME/git"
  local dir=$(eza -D $g_dir | fzf --height 50% --border --preview="eza -lah --color=always --icons --group-directories-first --git --no-permissions --ignore-glob=.git ~/git/{}" || false)
  if [ $dir ]; then; cd $g_dir/$dir && nvim .; fi
}

# Shortcuts
alias vim=nvim
alias tp=telepresence
alias z=zellij
alias g=gcloud
alias lz=lazygit
alias db=distrobox
alias kns=kubens

# include .ok_aliases if it exists
if [ -f $HOME/.ok_aliases ]; then
    source $HOME/.ok_aliases
fi

# Tilix Fix
# if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
#     source /etc/profile.d/vte.sh
# fi

# gcloud-auth-plugin
# export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Kubectl autocomplete
#source <(~/.local/bin/kubectl completion zsh)

# zoxide
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init --cmd j zsh)"
fi

# Starship
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# Atuin
if command -v atuin &> /dev/null; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

# Google CLoud SQL
# export PATH=$PATH:/usr/lib64/google-cloud-sdk/bin/

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
#autoload -U compinit && compinit

# Kubectl
export KUBECONFIG=./kubeconfig

# Git signing
export GPG_TTY=$(tty)

# Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Export default editor
export EDITOR=/usr/bin/nvim

# AWS Completion
complete -C '/snap/aws-cli/current/bin/aws_completer' aws

# Golang
export GOPATH=~/.go
export PATH=$PATH:~/.go/bin/
