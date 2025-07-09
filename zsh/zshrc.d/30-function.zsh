function refzsh() {
  rm -f '~/.zshrc.zwc'
  . ~/.zshrc
}

function details() {
  [ -n "$1" ] && summary="<summary>$1</summary>\n\n" || summary=""
  echo "<details>\n\n${summary}\`\`\`\n$(cat -)\n\`\`\`\n\n</details>"
}
