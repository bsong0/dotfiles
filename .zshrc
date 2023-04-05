# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
zstyle ':omz:update' frequency 13

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
plugins=(git zsh-syntax-highlighting F-Sy-H zsh-autosuggestions)

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


if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/llvm@12/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/llvm@12/include"
export PATH="/opt/homebrew/opt/llvm@12/bin:$PATH"
export PATH="/opt/homebrew/opt/libtool/bin/:$PATH"
export PATH="/Users/songboyao/.ghcup/bin:$PATH"
# aliases

alias v=vim

# Cli tool Settings

[ -f "/Users/songboyao/.ghcup/env" ] && source "/Users/songboyao/.ghcup/env" # ghcup-env

export EDITOR=nvim
export VISUAL="$EDITOR"

withBrewLLVM='LDFLAGS="-L/opt/homebrew/opt/llvm/lib" CPPFLAGS="-I/opt/homebrew/opt/llvm/include"'

export PATH="/Users/songboyao/.deta/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/songboyao/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/songboyao/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/songboyao/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/songboyao/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/openssl@3/include"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# fix haskell ghci input display bug

# alias ghci="TERM=dumb ghci"

# add matlab PATH
export PATH="/Applications/MATLAB_R2022b.app/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval $(thefuck --alias)
PROMPT=$(echo $PROMPT | sed 's/(base) //')
alias dumpClangProfile="clang-format -style=webkit -dump-config > .clang-format"
alias rp="realpath"

# export GHC_PACKAGE_PATH=~/.cabal/store/ghc-9.4.2/package.db/:
# export GHC_PACKAGE_PATH="$HOME/.cabal/store/ghc-$(ghc --version | grep -Eo "([0-9]{1,}\.)+[0-9]{1,}")/package.db/":
export GHC_PACKAGE_PATH="$HOME/.cabal/store/ghc-$(ghc --version | grep -Eo "([0-9]{1,}\.)+[0-9]{1,}")/package.db/":
GHC_ENV_PATH_TEMP="$(find $HOME/.ghc/*-$(ghc --version | grep -Eo "([0-9]{1,}\.)+[0-9]{1,}")/environments/default)" 2>/dev/null && mv $GHC_ENV_PATH_TEMP $GHC_ENV_PATH_TEMP.back 
# mv $HOME/.ghc/*-$(ghc --version | grep -Eo "([0-9]{1,}\.)+[0-9]{1,}")/environments/default $HOME/.ghc/$(ghc --version | grep -Eo "([0-9]{1,}\.)+[0-9]{1,}")/environments/default.bk 
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/libffi/include"
export PATH="/Users/songboyao/scripts:$PATH"

function focus_under_cursor {
  if yabai -m query --windows --space |
      jq -er 'map(select(.focused == 1)) | length == 0' >/dev/null; then
    yabai -m window --focus mouse 2>/dev/null || true
  fi
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/glew/include"
export PATH="/opt/homebrew/opt/qt5/bin:$PATH"

export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
# export PATH="/Users/songboyao/dev/pypy3.9-v7.3.11-macos_arm64/bin:$PATH"
export PATH="/Applications/Typora.app/Contents/MacOS:$PATH"
alias ls=exa
alias cat=bat
alias du=dust
alias df=duf
alias br=broot
alias dig=dog
eval "$(zoxide init zsh)"
alias cd=z

export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/include -L/opt/homebrew/lib"

export LIBRARY_PATH="/opt/homebrew/lib"
export PATH="$PATH:/Applications/Skim.app/Contents/MacOS/Skim"
export PATH="$PATH:/Users/songboyao/dev/glrnvim/target/release"

source /Users/songboyao/.config/broot/launcher/bash/br
export CMAKE_OSX_ARCHITECTURES="arm64"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
alias gist="gist -p -R -c"
alias vim=nvim
export PATH=$PATH:"/Users/songboyao/.local/pypy3.9-v7.3.11-macos_arm64/bin"
