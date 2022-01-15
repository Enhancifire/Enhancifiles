package theme

import (
	"fmt"
	"regexp"
	"strconv"
	"strings"

	"github.com/tomnomnom/xtermcolor"
)

var (
	exprCompoments = regexp.MustCompile(`^#(.{2})(.{2})(.{2})$`)
)

type Color string

func (c Color) Cterm() string {
	if c != "" && c != "NONE" {
		code, _ := xtermcolor.FromHexStr(string(c))
		return fmt.Sprintf("%d", code)
	}
	return "NONE"
}

func (c Color) Gui() string {
	if c != "" {
		return string(c)
	}
	return "NONE"
}

func (c Color) Hex() string {
	if c != "" {
		return string(c)
	}
	return ""
}

func (c Color) Hex0x() string {
	if c != "" {
		return strings.Replace(string(c), "#", "0x", 1)
	}
	return ""
}

func (c Color) Flat() string {
	return fmt.Sprintf("[ '%s', %s ]", c.Gui(), c.Cterm())
}

func (c Color) ObjProps(key string) string {
	if c != "" {
		return fmt.Sprintf("'gui%[1]s' :'%[2]s', 'cterm%[1]s' : '%[3]s'", key, c.Gui(), c.Cterm())
	}
	return ""
}

func (c Color) Iterm() string {

	components := []string{}

	p := exprCompoments.FindStringSubmatch(string(c))
	if len(p) == 4 {

		r, _ := strconv.ParseInt(p[1], 16, 32)
		g, _ := strconv.ParseInt(p[2], 16, 32)
		b, _ := strconv.ParseInt(p[3], 16, 32)

		components = append(
			components,
			fmt.Sprintf(`<key>Color Space</key><string>sRGB</string>`),
			fmt.Sprintf(`<key>Red Component</key><real>%f</real>`, float64(r)/255),
			fmt.Sprintf(`<key>Green Component</key><real>%f</real>`, float64(g)/255),
			fmt.Sprintf(`<key>Blue Component</key><real>%f</real>`, float64(b)/255),
			fmt.Sprintf(`<key>Alpha Component</key><real>1</real>`),
		)
	}

	return fmt.Sprintf(`<dict>%s</dict>`, strings.Join(components, ""))
}

func (c Color) Vim(key string) string {
	if c != "" {
		return fmt.Sprintf("gui%[1]s=%[2]s cterm%[1]s=%[3]s", key, c.Gui(), c.Cterm())
	}
	return ""
}

func (c Color) Xcode(opacity float32) string {

	p := exprCompoments.FindStringSubmatch(string(c))
	if len(p) == 4 {

		r, _ := strconv.ParseInt(p[1], 16, 32)
		g, _ := strconv.ParseInt(p[2], 16, 32)
		b, _ := strconv.ParseInt(p[3], 16, 32)

		return fmt.Sprintf(`%f %f %f %f`, float64(r)/255, float64(g)/255, float64(b)/255, opacity)
	}

	return ""

	// 	components = append(
	// 		components,
	// 		fmt.Sprintf(`<key>Color Space</key><string>sRGB</string>`),
	// 		fmt.Sprintf(`<key>Red Component</key><real>%f</real>`, float64(r)/255),
	// 		fmt.Sprintf(`<key>Green Component</key><real>%f</real>`, float64(g)/255),
	// 		fmt.Sprintf(`<key>Blue Component</key><real>%f</real>`, float64(b)/255),
	// 		fmt.Sprintf(`<key>Alpha Component</key><real>1</real>`),
	// 	)
	// }
	//
	// return fmt.Sprintf(`<dict>%s</dict>`, strings.Join(components, ""))
}

// <dict>
// <key>Alpha Component</key>
// <real>1</real>
// <key>Blue Component</key>
// <real>0.20392157137393951</real>
// <key>Color Space</key>
// <string>sRGB</string>
// <key>Green Component</key>
// <real>0.17254902422428131</real>
// <key>Red Component</key>
// <real>0.15686275064945221</real>
// </dict>
