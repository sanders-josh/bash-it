# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

SCM_THEME_PROMPT_DIRTY=" ${red?}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${bold_green?}✓${normal}"
SCM_THEME_PROMPT_PREFIX=" ${blue}"
SCM_THEME_PROMPT_SUFFIX="${reset_color} "

SCM_GIT_CHAR=""
SCM_GIT_AHEAD_CHAR="↑"
SCM_GIT_BEHIND_CHAR="↓"
SCM_GIT_AHEAD_BEHIND_PREFIX_CHAR=" "
SCM_GIT_UNTRACKED_CHAR="${red}?:"
SCM_GIT_UNSTAGED_CHAR="${yellow}U:"
SCM_GIT_STAGED_CHAR="${green}S:"
SCM_GIT_STASH_CHAR_PREFIX="${orange}{"
SCM_GIT_STASH_CHAR_SUFFIX="}${reset_color}"

GIT_THEME_PROMPT_DIRTY=" ${red?}✗${normal}"
GIT_THEME_PROMPT_CLEAN=" ${bold_green?}✓${normal}"
GIT_THEME_PROMPT_PREFIX=" ${blue}"
GIT_THEME_PROMPT_SUFFIX="${reset_color} "

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

# IP address
IP_SEPARATOR="${reset_color},${yellow}"

# FUNCS =======================================================================

function prompt_command() {
	# info line
	# • username@hostname:working_directory •
	PS1="\n${reset_color}• " # •
	PS1+="${cyan?}\u" # username
	PS1+="${reset_color}@" # @
	PS1+="${yellow}\h" # hostname
	PS1+="${reset_color}:" # :
	PS1+="${green}\w" # working directory
	PS1+="${reset_color} •" # •

	# input line with scm info
	scm_info="$(scm_prompt)"
	if [ "$scm_info" != " " ]; then
		PS1+=" "
	fi
	
	PS1+="\n${reset_color}${scm_info}${reset_color} → "
}

safe_append_prompt_command prompt_command
