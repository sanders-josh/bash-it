# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

SCM_THEME_PROMPT_DIRTY=" ${red?}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${bold_green?}✓${normal}"
SCM_THEME_PROMPT_PREFIX=" ${blue}"
SCM_THEME_PROMPT_SUFFIX="${reset_color} "

SCM_GIT_CHAR=""
SCM_GIT_AHEAD_CHAR="${green}↑"
SCM_GIT_BEHIND_CHAR="${yellow}↓"
SCM_GIT_AHEAD_BEHIND_PREFIX_CHAR=" "
SCM_GIT_UNTRACKED_CHAR="${red}?"
SCM_GIT_UNSTAGED_CHAR="${yellow}+"
SCM_GIT_STAGED_CHAR="${green}•"
SCM_GIT_STASH_CHAR_PREFIX="${orange}{"
SCM_GIT_STASH_CHAR_SUFFIX="}${reset_color}"

GIT_THEME_PROMPT_DIRTY=" ${red?}✗${normal}"
GIT_THEME_PROMPT_CLEAN=" ${bold_green?}✓${normal}"
GIT_THEME_PROMPT_PREFIX=" ${blue}"
GIT_THEME_PROMPT_SUFFIX="${reset_color} "

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

VIRTUALENV_THEME_PROMPT_PREFIX=" ("
VIRTUALENV_THEME_PROMPT_SUFFIX=""
PYTHON_THEME_PROMPT_PREFIX=" | "
PYTHON_THEME_PROMPT_SUFFIX=")"

# IP address
IP_SEPARATOR="${reset_color},${yellow}"

# FUNCS =======================================================================

function virtualenv_prompt() {
	local virtualenv
	local py_version
	if [[ -n "${VIRTUAL_ENV:-}" ]]; then
		virtualenv="${VIRTUAL_ENV##*/}"
		echo -ne "${VIRTUALENV_THEME_PROMPT_PREFIX-}${virtualenv}${VIRTUALENV_THEME_PROMPT_SUFFIX-}"
		py_version_prompt
	fi
}

function py_version_prompt() {
	local py_version
	py_version="$(python --version 2>&1 | awk 'NR==1{print $2;}')" || return
	echo -ne "${PYTHON_THEME_PROMPT_PREFIX-}${py_version}${PYTHON_THEME_PROMPT_SUFFIX-}"
}

function prompt_command() {
	# info line
	# • username@hostname:working_directory (venv | python-version)•
	PS1="\n${reset_color}• " # •
	PS1+="${cyan?}\u" # username
	PS1+="${reset_color}@" # @
	PS1+="${yellow}\h" # hostname
	PS1+="${reset_color}:" # :
	PS1+="${green}\w" # working directory
	PS1+="${reset_color}$(virtualenv_prompt)" # virtualenv
	PS1+="${reset_color} •" # •

	# input line with python and scm info
	
	PS1+="\n${reset_color}$(scm_prompt)${reset_color} → "
}

safe_append_prompt_command prompt_command
