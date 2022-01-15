package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"text/template"

	"path/filepath"

	"github.com/josa42/theme-generator/build/theme"
	"gopkg.in/yaml.v2"
)

func main() {
	theme := theme.Theme{}

	content, err := ioutil.ReadFile("themes/onedark.yml")
	if err != nil {
		log.Fatalf("error: %v", err)
	}

	if err := yaml.Unmarshal(content, &theme); err != nil {
		log.Fatalf("error: %v", err)
	}

	writeTheme(theme, "theme.vim", "./dist/vim/colors/theonedark.vim")
	writeTheme(theme, "lightline.vim", "./dist/vim/autoload/lightline/colorscheme/theonedark.vim")
	writeTheme(theme, "airline.vim", "./dist/vim/autoload/airline/themes/theonedark.vim")
	writeTheme(theme, "theme.tmux", "./dist/tmux/theonedark.tmux")
	writeTheme(theme, "clap.vim", "./dist/vim/autoload/clap/themes/theonedark.vim")
	writeTheme(theme, "theme.itermcolors", "./dist/iterm2/theonedark.itermcolors")
	writeTheme(theme, "alacritty.yml", "./dist/alacritty/colors.yml")
	writeTheme(theme, "kitty.conf", "./dist/kitty/theonedark.conf")
	writeTheme(theme, "slack.txt", "./dist/slack/colors.txt")
	writeTheme(theme, "theme.xccolortheme", "./dist/xcode/TheOneDark.xccolortheme")

	// theme.

	os.Chmod("./dist/tmux/theonedark.tmux", os.ModePerm)
}

func writeTheme(theme theme.Theme, templateName string, filePath string) {

	dir := filepath.Dir(filePath)
	if _, err := os.Stat(dir); os.IsNotExist(err) {
		os.MkdirAll(dir, os.ModePerm)
	}
	fmt.Printf("theme: %s\n", templateName)
	templ, err := template.New(templateName).ParseFiles("templates/" + templateName)
	if err != nil {
		log.Fatalf("error: %v", err)
	}

	f, err := os.Create(filePath)
	if err != nil {
		log.Fatalf("error: %v", err)
	}

	if err := templ.Execute(f, theme); err != nil {
		log.Fatalf("error: %v", err)
	}
}
