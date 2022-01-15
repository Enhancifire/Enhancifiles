#!/bin/bash

s() {
  echo "${2} - ${1}"
  osascript scripts/screenshot.applescript \
    "$(pwd)" \
    "$(which nvim)" \
    scripts/config/init-${1}.vim \
    examples/${2} \
    screenshots/vim-${2}-${1}.png

  wt "    <div><b>$(pluginInfo "$c")</b></div>"
  wt '    <img style="width: 67%;" src="../screenshots/'"vim-$f-$c.png"'" />'

  optipng screenshots/vim-${2}-${1}.png 2> /dev/null > /dev/null &
}

ws() {
  echo "$@" >> ./docs/screenshots.md
}

wt() {
  echo "$@" >> ./tmp.md
}

pluginInfo() {
  case $1 in
    base)     echo 'Neovim buildin';;
    polyglot) echo '<a href="github.com/sheerun/vim-polyglot">sheerun/vim-polyglot</a>' ;;
    vim-js)   echo '<a href="https://github.com/yuezk/vim-js">yuezk/vim-js</a> and <a href="https://github.com/maxmellon/vim-jsx-pretty">maxmellon/vim-jsx-pretty</a>' ;;
    yajs)     echo '<a href="github.com/othree/yajs.vim">othree/yajs.vim</a>' ;;
  esac
}


jsfiles=("test.js" "test.jsx")
types=("base" "polyglot")
jsTypes=("base" "polyglot" "vim-js" "yajs")
files=${1:-$(ls examples)}

rm -f ./docs/screenshots.md ./tmp.md

for f in $(find 'scripts/config' -type f -name 'init-*.vim'); do
  nvim -u $f +PlugInstall +PlugUpdate +qa
done

ws '# Screeshots'
ws ''
ws '## Neovim / Vim'
ws ''


for f in ${files[@]}; do
  if [[ $f =~ \.jsx?$ ]]; then
    for c in ${jsTypes[@]}; do s "$c" "$f"; done
  else
    for c in ${types[@]}; do s "$c" "$f"; done
  fi

  info=$(pluginInfo "c")

  ws '### `'$(echo $f | sed 's/^.*\.\([^.]*\)$/\1/')'`'
  ws ''
  ws '<img style="width: 67%;" src="../screenshots/'"vim-$f-polyglot.png"'" />'
  ws ''
  ws '<details>'
  ws '    <summary>All Plugins</summary>'
  cat ./tmp.md >> ./docs/screenshots.md
  ws '</details>'
  ws ''
  rm -f ./tmp.md

done

# optipng screenshots/*.png

echo wait…
wait

