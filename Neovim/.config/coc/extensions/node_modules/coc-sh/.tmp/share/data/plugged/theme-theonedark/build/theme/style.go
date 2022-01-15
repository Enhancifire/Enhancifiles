package theme

import (
	"fmt"
	"strings"
)

type Style struct {
	Background *Color `yaml:"background"`
	Foreground *Color `yaml:"foreground"`
	Font       Font   `yaml:"font"`
}

func (s Style) String() string {

	str := []string{}
	if s.Foreground != nil {
		str = append(
			str,
			fmt.Sprintf("guifg=%s", s.Foreground.Gui()),
			fmt.Sprintf("ctermfg=%s", s.Foreground.Cterm()),
		)
	}
	if s.Background != nil {
		str = append(
			str,
			fmt.Sprintf("guibg=%s", s.Background.Gui()),
			fmt.Sprintf("ctermbg=%s", s.Background.Cterm()),
		)
	}

	str = append(str,
		fmt.Sprintf("gui=%s", s.Font.String()),
		fmt.Sprintf("cterm=%s", s.Font.String()),
	)

	return strings.Join(str, " ")
}

func (s Style) Flat() string {
	if s.Font != "" {
		return fmt.Sprintf("[ %s, %s, '%s' ]", s.Foreground.Flat(), s.Background.Flat(), s.Font)
	}

	return fmt.Sprintf("[ %s, %s ]", s.Foreground.Flat(), s.Background.Flat())
}

func (s Style) ObjProps() string {
	parts := []string{}

	if s.Foreground != nil {
		parts = append(parts, s.Foreground.ObjProps("fg"))
	}
	if s.Background != nil {
		parts = append(parts, s.Background.ObjProps("bg"))
	}
	if s.Font != "" {
		parts = append(parts, s.Font.ObjProps())
	}

	return strings.Join(parts, ", ")
}

func (s Style) Obj() string {
	return fmt.Sprintf("{ %s }", s.ObjProps())
}

func (s Style) Flater() string {
	// if s.Font != "" {
	// 	return fmt.Sprintf("[ %s, %s, '%s' ]", s.Foreground.Flat(), s.Background.Flat(), s.Font)
	// }
	//
	return fmt.Sprintf("[ '%s', '%s', %s, %s ]", s.Foreground.Gui(), s.Background.Gui(), s.Foreground.Cterm(), s.Background.Cterm())
}
