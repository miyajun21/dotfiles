# .zshrc
autoload -Uz zmv
#------------------------- alias -------------------------#
alias ll='ls -la'
alias l='ls -la'
alias lr='ls -ltra'
alias where='echo `hostname`:`pwd` | sed -e 's/.yahoo.co.jp//g''
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias taily='tail -f /home/y/logs/yapache/error'
alias findf='find -type f'
alias reloadzsh='source ~/.zshrc'
alias zmv='noglob zmv -W'
alias cl='clear'
alias psr='php -d include_path=/home/y/lib/php22/pear `which phpcs` --standard=PSR2'
#--------------------- user function ---------------------#
# ホスト固有のPATH設定ファイルがある場合読み込む
LOCALPATH_ZSHRC="$HOME/.zshrc_localpath"
if [ -f "$LOCALPATH_ZSHRC" ]; then
  source $LOCALPATH_ZSHRC
fi

PATH=$HOME/bin/:$PATH:/home/y/bin:/home/y/bin64:/usr/local/bin/:
export PATH
export EDITOR=vim

## LANG
export LANG=ja_JP.UTF-8

HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

## 補完機能の強化
autoload -U compinit
compinit

## コアダンプサイズを制限
limit coredumpsize 102400
## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr
## Emacsライクキーバインド設定
bindkey -e

## 色を使う
setopt prompt_subst
## ビープを鳴らさない
setopt nobeep
## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types
## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume
## 補完候補を一覧表示
setopt auto_list
## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
## cd 時に自動で push
setopt auto_pushd
## 同じディレクトリを pushd しない
setopt pushd_ignore_dups
## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob
## TAB で順に補完候補を切り替える
setopt auto_menu
## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history
## =command を command のパス名に展開する
setopt equals
## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify
## ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
## 出力時8ビットを通す
setopt print_eight_bit
## ヒストリを共有
setopt share_history
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
## 補完候補の色づけ
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## ディレクトリ名だけで cd
setopt auto_cd
## カッコの対応などを自動的に補完
setopt auto_param_keys
## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
## スペルチェック
setopt correct
## {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
## Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control
## コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space
## コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
## ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
## history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
## 補完候補を詰めて表示
setopt list_packed
## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash

ZSH_THEME="steeef"

## プロンプトの設定
autoload colors
colors

#local PROMPT_COLOR=cyan   # dev
#local PROMPT_COLOR=blue   # ALPHA
#local PROMPT_COLOR=yellow # BETA
local PROMPT_COLOR=red    # PROD

#local PROMPT_ENV=dev   # dev
#local PROMPT_ENV=miniy # ALPHA
#local PROMPT_ENV=beta  # BETA
local PROMPT_ENV=prod  # PROD

local HOSTNAME_SHORT=`hostname | sed -e 's/.yahoo.co.jp//g'`

PROMPT="%{${fg[${PROMPT_COLOR}]}%}[${PROMPT_ENV}][${USER}@${HOSTNAME_SHORT}][%D{%y/%m/%d %T}]%{${reset_color}%} %~
%# "

# Other Prompt
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="`echo $LANG`"

# etc
function pcolor() {
    for ((f = 0; f < 255; f++)); do
        printf "\e[38;5;%dm %3d#\e[m" $f $f
        if [[ $f%8 -eq 7 ]] then
            printf "\n"
        fi
    done
    echo
}

# git branch表示
# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"

# ホスト固有の設定ファイルがある場合読み込む
LOCAL_ZSHRC="$HOME/.zshrc_local"
if [ -f "$LOCAL_ZSHRC" ]; then
  source $LOCAL_ZSHRC
fi

eval `dircolors`
