# Created by newuser for 5.0.0

##コマンドのオプションを強力に補完
autoload -U compinit
compinit

##historyの設定
#historyを保存するファイル
HISTFILE=~/.zsh.d/.zsh_history
#大きなサイズを指定してhistoryを残す
HISTSIZE=10000000
#保存するhistory数
SAVEHIST=$HISTSIZE

# コマンドラインだけではなく実行時刻と実行時間も保存する
setopt extended_history
# 複数のzshを同時に使う時などhistoryファイルに上書きせず追加する
setopt append_history
# 同じコマンドラインを連続で実行した場合は登録しない
setopt hist_ignore_dups
# スペースで始まるコマンドラインは追加しない
setopt hist_ignore_space
# すぐにhistoryファイルに追記する
setopt inc_append_history
# zshプロセス間でhistoryを共有する
setopt share_history
# historyコマンドを記録しない
setopt hist_no_store
# 余分なスペースを削除して記録する
setopt hist_reduce_blanks

# C-s C-qを無効
setopt no_flow_control

# ディレクトリ名だけでディレクトリへ移動
setopt auto_cd

# 補完候補が複数ある時に一覧を表示する
setopt auto_list

# 保管結果を詰める
setopt list_packed

# Tabで順に補完候補を自動で補完する
setopt auto_menu

# カッコなどを自動的に補完する
setopt auto_param_keys

# ディレクトリ名の補完で末尾のスラッシュを付加して次の補完に備える
setopt auto_param_slash

# ビープ音を鳴らさない
setopt no_beep

#from terminal graphic preview
alias ql='qlmanage -p "$@" >& /dev/null'

#color
autoload colors
colors

#プロンプト
PROMPT="%{${fg[green]}%}[%n] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[yellow]}%}[%~]%{${reset_color}%}"

#ls colors
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad


# 補完の時に大文字小文字を区別しない(但し、大文字を打った場合は小文字に変換しない)
#
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

