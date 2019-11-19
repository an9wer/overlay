base16() {
  if (( ${#@} == 0 )); then
    if [[ -v BASE16_THEME ]]; then
      echo "${BASE16_THEME}"
      base16-resource
    elif [[ -r ~/.base16 ]]; then
      head -n1 ~/.base16
      base16-resource
    else
      echo unset
      return 1
    fi
  elif (( ${#@} == 1 )); then
    echo "$1" > ~/.base16
    base16-resource
  else
    echo "Support only one argument at a time."
    return 1
  fi
}

base16-clear() {
  unset BASE16_THEME
  [[ -r ~/.base16 ]] && rm ~/.base16
  # TODO: Unset color 1-16
  echo "Please restart your shell to make changes effect."
}

base16-resource() {
  local base16_theme
  if [[ -v BASE16_THEME ]]; then
    base16_theme=$BASE16_THEME
  elif [[ -r ~/.base16 ]]; then
    base16_theme=$(head -n1 ~/.base16)
  else
    return 1
  fi

  if [[ -n $base16_theme ]]; then
    if [[ -r /usr/share/base16-shell/scripts/base16-$base16_theme.sh ]]; then
      source /usr/share/base16-shell/scripts/base16-$base16_theme.sh
    else
      echo "Theme '$base16_theme' doesn't exist."
      return 1
    fi
  else
    return 1
  fi
}

# Bash completion of base16
complete -W \
  "$(ls /usr/share/base16-shell/scripts/base16-*.sh |
      xargs -n1 basename -s .sh | cut -c 8-)" \
  base16

# Run when starting up
base16-resource
