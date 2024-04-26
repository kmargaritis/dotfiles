# Add `~/bin` to the `$PATH`
export PATH="/opt/homebrew/sbin:$HOME/bin:$HOME/.rvm/bin:$HOME/.jenv/bin:/opt/homebrew/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /opt/homebrew/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# Load nvm script
if [[ -s $(brew --prefix nvm)/nvm.sh ]]; then
  # Set download NVM dir
  export NVM_DIR=~/.nvm;

  source $(brew --prefix nvm)/nvm.sh

  # Enable bash completion
  [[ -r $NVM_DIR/bash_completion ]] && source $NVM_DIR/bash_completion

  # Set NVM to use node on start up (non interactive mode can use nvm).
  # In case you are not using default node for your shell uncomment
  # the following line to use node or a specific version of node.
  # nvm use node
fi


# Add npm auto complete
source ~/.nvm/versions/node/`nvm current`/lib/node_modules/npm/lib/utils/completion.sh

# Add z
source `brew --prefix`/etc/profile.d/z.sh

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true;
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache;

export VIRTUAL_ENV_DISABLE_PROMPT=1

# Add virtualenvwrapper for managing virtualenv
source /opt/homebrew/bin/virtualenvwrapper.sh

# Set venv as working virtual env
workon venv

# Enable bash completion for pip
# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

# AWS bash completion
complete -C aws_completer aws

#Git-flow bash completion
source ~/init/git/git-flow-completion.sh

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Profile currently not used
# source ~/.profile;

# RVM bash completion
[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion

if [ "$TERM_PROGRAM" == "iTerm.app" ]; then
    # Powerline feature for Bash
    if [ -d "$VIRTUAL_ENV/lib/python3.12/site-packages/powerline" ]; then
        powerline-daemon -q
        POWERLINE_BASH_CONTINUATION=1
        POWERLINE_BASH_SELECT=1
        source $HOME/.virtualenvs/venv/lib/python3.12/site-packages/powerline/bindings/bash/powerline.sh
    fi
fi

# Load jenv
if which jenv > /dev/null; then
    eval "$(jenv init -)";
fi

if [ -f ~/init/maven/m2 ]; then
  . ~/init/maven/m2
fi

hash grunt >/dev/null 2>&1 && {
    eval "$(grunt --completion=bash)"
}

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

