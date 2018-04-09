# Force SHELL to be zsh
SHELL=/bin/zsh

source /etc/zsh/zprofile

# Source all generic and zsh specific config from ~/.shell
for conf in `ls ~/.shell/*.sh ~/.shell/*.zsh`; do
	source ${conf}
done

# Print job status before exiting shell
setopt check_jobs
# Background job have the same priority as foreground ones
unsetopt bg_nice
# Display a message in case we got new mail
setopt mail_warning

# No beeps
unsetopt beep

# Allow to comment lines in interactive shell
setopt interactive_comments

# Auto correct commands
setopt correct

# Ask for confirmation when removing files with '*'
unsetopt rm_star_silent

# Handle symbolic links in paths
setopt chase_dots

# Resolve symbolic links
setopt chase_links

# Enable extended globing
setopt extendedglob

# When globing is used in an argument list, remove unmatched elements instead
# of outputting an error. Disabled to avoid unwanted side effects with 'ls'.
unsetopt nullglob

# Fish shell like syntax highlighting for Zsh
source ~/.shell/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# It seems like this one as to be done at the end
compinit

# kubectl completion
# source <(kubectl completion zsh)
