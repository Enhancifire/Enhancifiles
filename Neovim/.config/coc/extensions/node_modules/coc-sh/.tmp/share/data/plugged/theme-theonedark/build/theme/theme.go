package theme

type Theme struct {

	// Base
	Body Style `yaml:"body"`

	// Colors
	Black        Color `yaml:"black"`
	BlackBright  Color `yaml:"black_bright"`
	BlackDim     Color `yaml:"black_dim"`
	Blue         Color `yaml:"blue"`
	BlueBright   Color `yaml:"blue_bright"`
	BlueDim      Color `yaml:"blue_dim"`
	Cyan         Color `yaml:"cyan"`
	CyanBright   Color `yaml:"cyan_bright"`
	CyanDim      Color `yaml:"cyan_dim"`
	Green        Color `yaml:"green"`
	GreenBright  Color `yaml:"green_bright"`
	GreenDim     Color `yaml:"green_dim"`
	Purple       Color `yaml:"purple"`
	PurpleBright Color `yaml:"purple_bright"`
	PurpleDim    Color `yaml:"purple_dim"`
	Red          Color `yaml:"red"`
	RedBright    Color `yaml:"red_bright"`
	RedDim       Color `yaml:"red_dim"`
	White        Color `yaml:"white"`
	WhiteBright  Color `yaml:"white_bright"`
	WhiteDim     Color `yaml:"white_dim"`
	Yellow       Color `yaml:"yellow"`
	YellowBright Color `yaml:"yellow_bright"`
	YellowDim    Color `yaml:"yellow_dim"`

	Grey       Color `yaml:"grey"`
	VisualGrey Color `yaml:"visual_grey"`

	DarkRed    Color `yaml:"dark_red"`
	DarkYellow Color `yaml:"dark_yellow"`
	// s:visual_grey.gui
	// s:dark_red.gui
	// s:green.gui " No da
	// s:dark_yellow.gui
	// s:blue.gui " No dar
	// s:purple.gui " No d
	// s:cyan.gui " No dar
	// s:comment_grey.gui

	BlackDark Color `yaml:"black_dark"`

	// Base
	Constant       Style `yaml:"constant"`
	String         Style `yaml:"string"`
	Character      Style `yaml:"character"`
	Number         Style `yaml:"number"`
	Boolean        Style `yaml:"boolean"`
	Float          Style `yaml:"float"`
	Identifier     Style `yaml:"identifier"`
	Function       Style `yaml:"function"`
	Statement      Style `yaml:"statement"`
	Conditional    Style `yaml:"conditional"`
	Repeat         Style `yaml:"repeat"`
	Label          Style `yaml:"label"`
	Operator       Style `yaml:"operator"`
	Keyword        Style `yaml:"keyword"`
	Exception      Style `yaml:"exception"`
	PreProc        Style `yaml:"pre_proc"`
	Include        Style `yaml:"include"`
	Define         Style `yaml:"define"`
	Macro          Style `yaml:"macro"`
	PreCondit      Style `yaml:"pre_condit"`
	Type           Style `yaml:"type"`
	StorageClass   Style `yaml:"storage_class"`
	Structure      Style `yaml:"structure"`
	Typedef        Style `yaml:"typedef"`
	Special        Style `yaml:"special"`
	SpecialChar    Style `yaml:"special_char"`
	Tag            Style `yaml:"tag"`
	Delimiter      Style `yaml:"delimiter"`
	SpecialComment Style `yaml:"special_comment"`
	Debug          Style `yaml:"debug"`
	Underlined     Style `yaml:"underlined"`
	Ignore         Style `yaml:"ignore"`
	// Error          Style `yaml:"error"`
	Todo Style `yaml:"todo"`

	ColorColumn      Style `yaml:"color_column"`
	Conceal          Style `yaml:"conceal"`
	Cursor           Style `yaml:"cursor"`
	CursorIM         Style `yaml:"cursor_im"`
	CursorColumn     Style `yaml:"cursor_column"`
	CursorLine       Style `yaml:"cursor_line"`
	Directory        Style `yaml:"directory"`
	DiffAdd          Style `yaml:"diff_add"`
	DiffChange       Style `yaml:"diff_change"`
	DiffDelete       Style `yaml:"diff_delete"`
	DiffText         Style `yaml:"diff_text"`
	DiffCursorLine   Style `yaml:"diff_cursor_line"`
	EndOfBuffer      Style `yaml:"end_of_buffer"`
	ErrorMsg         Style `yaml:"error_msg"`
	VertSplit        Style `yaml:"vert_split"`
	Folded           Style `yaml:"folded"`
	FoldColumn       Style `yaml:"fold_column"`
	SignColumn       Style `yaml:"sign_column"`
	IncSearch        Style `yaml:"inc_search"`
	LineNr           Style `yaml:"line_nr"`
	CursorLineNr     Style `yaml:"cursor_line_nr"`
	MatchParen       Style `yaml:"match_paren"`
	ModeMsg          Style `yaml:"mode_msg"`
	MoreMsg          Style `yaml:"more_msg"`
	NonText          Style `yaml:"non_text"`
	Normal           Style `yaml:"normal"`
	Pmenu            Style `yaml:"pmenu"`
	PmenuSel         Style `yaml:"pmenu_sel"`
	PmenuSbar        Style `yaml:"pmenu_sbar"`
	PmenuThumb       Style `yaml:"pmenu_thumb"`
	Question         Style `yaml:"question"`
	QuickFixLine     Style `yaml:"quick_fix_line"`
	Search           Style `yaml:"search"`
	SpecialKey       Style `yaml:"special_key"`
	SpellBad         Style `yaml:"spell_bad"`
	SpellCap         Style `yaml:"spell_cap"`
	SpellLocal       Style `yaml:"spell_local"`
	SpellRare        Style `yaml:"spell_rare"`
	StatusLine       Style `yaml:"status_line"`
	StatusLineNC     Style `yaml:"status_line_nc"`
	StatusLineTerm   Style `yaml:"status_line_term"`
	StatusLineTermNC Style `yaml:"status_line_term_nc"`
	TabLine          Style `yaml:"tab_line"`
	TabLineFill      Style `yaml:"tab_line_fill"`
	TabLineSel       Style `yaml:"tab_line_sel"`
	Terminal         Style `yaml:"terminal"`
	Title            Style `yaml:"title"`
	Visual           Style `yaml:"visual"`
	VisualNOS        Style `yaml:"visual_nos"`
	WarningMsg       Style `yaml:"warning_msg"`
	WildMenu         Style `yaml:"wild_menu"`

	// Language
	ClassName        Style `yaml:"class_name"`
	ExtendsClassName Style `yaml:"exetnds_class_name"`
	Property         Style `yaml:"property"`

	Brace         Style `yaml:"brace"`
	TemplateBrace Style `yaml:"template_brace"`
	Null          Style `yaml:"null"`

	Comment   Style `yaml:"comment"`
	Highlight Style `yaml:"highlight"`

	// Diagnostics
	Error       Style `yaml:"error"`
	Warning     Style `yaml:"warning"`
	Information Style `yaml:"information"`
	Hint        Style `yaml:"hint"`
	OK          Style `yaml:"ok"`

	Text          Style `yaml:"text"`
	TextUnderline Style `yaml:"text_underline"`
	TextItalic    Style `yaml:"text_italic"`
	TextBold      Style `yaml:"text_bold"`

	// Gutter
	GutterAdded   Style `yaml:"gutter_added"`
	GutterChanged Style `yaml:"gutter_changed"`
	GutterRemoved Style `yaml:"gutter_removed"`

	// Tabs
	TabActive Style `yaml:"tab_active"`
	Tabbar    Style `yaml:"tabbar"`

	// Status
	Statusbar                 Style `yaml:"statusbar"`
	StatusbarInactive         Style `yaml:"statusbar_inactive"`
	StatusbarNormal           Style `yaml:"statusbar_normal"`
	StatusbarNormalPrimary    Style `yaml:"statusbar_normal_primary"`
	StatusbarNormalSecondary  Style `yaml:"statusbar_normal_secondary"`
	StatusbarInsert           Style `yaml:"statusbar_insert"`
	StatusbarInsertPrimary    Style `yaml:"statusbar_insert_primary"`
	StatusbarInsertSecondary  Style `yaml:"statusbar_insert_secondary"`
	StatusbarReplace          Style `yaml:"statusbar_replace"`
	StatusbarReplacePrimary   Style `yaml:"statusbar_replace_primary"`
	StatusbarReplaceSecondary Style `yaml:"statusbar_replace_secondary"`
	StatusbarVisual           Style `yaml:"statusbar_visual"`
	StatusbarVisualPrimary    Style `yaml:"statusbar_visual_primary"`
	StatusbarVisualSecondary  Style `yaml:"statusbar_visual_secondary"`
	StatusbarError            Style `yaml:"statusbar_error"`
	StatusbarWarning          Style `yaml:"statusbar_warning"`

	// Dialog
	Dialog         Style `yaml:"dialog"`
	DialogBody     Style `yaml:"dialog_body"`
	DialogInput    Style `yaml:"dialog_input"`
	DialogSelected Style `yaml:"dialog_selected"`

	// XML / HTML
	TagSurround Style `yaml:"tag_surround"`
	TagName     Style `yaml:"tag_name"`
	TagAttr     Style `yaml:"tag_attr"`
}

func (t Theme) Bold() Font {
	return Font("bold")
}

func (t Theme) Underline() Font {
	return Font("underline")
}

func (t Theme) Italic() Font {
	return Font("italic")
}
