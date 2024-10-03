function details() {
  [ -n "$1" ] && summary="<summary>$1</summary>\n\n" || summary=""
  echo "<details>\n\n${summary}\`\`\`console\n$(cat -)\n\`\`\`\n\n</details>"
}
