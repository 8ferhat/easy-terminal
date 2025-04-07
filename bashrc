###################### 
#====================#
#  easy-terminal     #
#     by             #
#       8ferhat      #
######################


# =======================================================
#  Aliases for common commands
# =======================================================
alias ll='ls -lAh'             # long listing with human-readable file sizes
alias la='ls -A'               # list all except . and ..
alias l='ls -lh'               # list files with human-readable sizes
alias ..='cd ..'               # shortcut to navigate up one directory
alias ...='cd ../..'           # shortcut to navigate up two directories
alias h='history'              # easy way to access history

# Explanation:
# These aliases make your shell experience more efficient by shortening common commands.
# For instance, `ll` gives a detailed file listing with human-readable sizes,
# and `grep` will always show search results with color.



# =======================================================
#  Enable auto-completion for `cd`
# =======================================================
shopt -s autocd

# Explanation:
# The `autocd` option allows you to change directories simply by typing their name, without needing `cd`.



# =======================================================
#  Programmable Completion (if available)
# =======================================================
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Explanation:
# This loads system-wide bash completions for commands, improving your experience with tools like `git`, `docker`, etc.
# It gives you suggestions and tab completions for many commands.



# =======================================================
#  Git Integration in Prompt
# =======================================================
parse_git_branch() {
    git branch 2>/dev/null | sed -n '/\*/s/\* \(.*\)/ (\1)/p'
}
export PS1='[\u@\h \W$(parse_git_branch)]\$ '  # User@host current_directory (git_branch)

# Explanation:
# `parse_git_branch` shows the current Git branch. 
# For example, if you're inside a git repo, the prompt might look like `user@hostname current_folder (master)$`.
# This might be useful for Git users who need to be aware of their Git status.



# =======================================================
#  History Management
# =======================================================
export HISTCONTROL=ignoredups:ignorespace   # Ignore duplicate commands and commands starting with space
export HISTSIZE=10000                        # Store 10,000 commands in memory
export HISTFILESIZE=10000                    # Store 10,000 commands in the history file
shopt -s histappend                         # Append to the history file instead of overwriting

# Explanation:
# `HISTCONTROL` prevents duplicate and unnecessary entries from being stored in history.
# `HISTSIZE` and `HISTFILESIZE` control the number of commands that are stored in memory and in the `.bash_history` file.
# `histappend` makes sure history is added to the end instead of overwriting.



# =======================================================
#  Add Custom Directories to $PATH
# =======================================================
export PATH=$HOME/bin:$PATH

# Explanation:
# This adds `$HOME/bin` to your `$PATH`, so any executable scripts you put there will be available globally.



# =======================================================
#  Terminal Behavior Enhancements
# =======================================================
shopt -s checkwinsize   # Automatically adjust the window size after each command

# Explanation:
# `checkwinsize` ensures the terminal window size is updated correctly, especially when resizing the terminal.




# =======================================================
#  Custom Functions
# =======================================================

# Create and cd into a directory
mkcd() { mkdir -p "$1" && cd "$1"; }

# Show basic system information
sysinfo() { echo "System Information:"; uname -a; echo "Memory Usage:"; free -h; }

# Show a quick Git status
git_status() { git status --short --branch; }

# Explanation:
# `mkcd` creates a directory and immediately navigates into it.
# `sysinfo` displays system info like the kernel version and memory usage.
# `git_status` displays a condensed view of your current Git repository's status.



# =======================================================
#  Make sure the terminal behaves as expected
# =======================================================
shopt -s checkwinsize   # Refresh terminal window size after each command
export HISTCONTROL=ignoreboth  # Ignore duplicate commands and blank lines



# ========================================
#  adds fastfetch to terminal when opening
# ========================================
fastfetch

# Explanation:
# Executes fastfetch when starting the terminal 
