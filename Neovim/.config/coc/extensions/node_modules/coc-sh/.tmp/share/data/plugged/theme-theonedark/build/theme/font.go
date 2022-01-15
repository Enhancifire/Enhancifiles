package theme

import "fmt"

type Font string

func (f Font) String() string {
	if f != "" {
		return string(f)
	}
	return "NONE"
}

func (f Font) ObjProps() string {
	if f != "" {
		return fmt.Sprintf("'gui' :'%[1]s', 'cterm' : '%[1]s'", f.String())
	}
	return ""
}

func (f Font) Vim() string {
	if f != "" {
		return fmt.Sprintf("gui=%[1]s cterm=%[1]s", f.String())
	}
	return ""
}
