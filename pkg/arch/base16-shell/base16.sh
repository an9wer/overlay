base16() {
  if (( ${#@} == 0 )); then
    # Display current scheme
    echo ${BASE16_THEME:-Unset}
  elif (( ${#@} > 1 )); then
    echo "Only support one argument."
    return 1
  else
    # Verify argument $1 which points to some scheme
    if [[ -f /usr/share/base16-shell/scripts/base16-$1.sh ]]; then
      export BASE16_THEME=$1
      base16-resource
    else
      echo "Unknown scheme '$1'."
      return 1
    fi
  fi
}

base16-clear() {
  unset BASE16_THEME
  #TODO: How to unset color 1-16
  echo "Please restart your shell to make changes effect."
}

base16-resource() {
  if [[ -v BASE16_THEME ]]; then
    if [[ -f /usr/share/base16-shell/scripts/base16-$BASE16_THEME.sh ]]; then
      source /usr/share/base16-shell/scripts/base16-$BASE16_THEME.sh
    else
      echo "Theme '$BASE16_THEME' doesn't exist."
      return 1
    fi
  else
    echo "Variable 'BASE16_THEME' is unset."
    return 1
  fi
}

# Bash completion of base16
complete -W \
  "$(ls /usr/share/base16-shell/scripts/base16-*.sh |
      xargs -n1 basename -s .sh | cut -c 8-)" \
  base16
