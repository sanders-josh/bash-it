# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

SCM_THEME_PROMPT_DIRTY=" ${red?}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${bold_green?}✓${normal}"
SCM_THEME_PROMPT_PREFIX=" ${blue}"
SCM_THEME_PROMPT_SUFFIX="${reset_color} "
SCM_GIT_CHAR=""

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
