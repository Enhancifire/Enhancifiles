# coc-format-json

![NPM](https://img.shields.io/npm/v/coc-format-json.svg)
![License](https://img.shields.io/npm/l/coc-format-json.svg)
![Downloads](https://img.shields.io/npm/dt/coc-format-json.svg)

Format JSON strings on top of [coc.nvim](https://github.com/neoclide/coc.nvim), the JavaScript way.

![formatJson](https://user-images.githubusercontent.com/3139113/88083845-1bda5000-cbb6-11ea-9ac3-b50e61de427f.gif)

## Installation

First, make sure [coc.nvim](https://github.com/neoclide/coc.nvim) is started.

Then install with the Vim command:

```viml
:CocInstall coc-format-json
```

## Usage

Make sure the text to be serialized is valid JSON or text that can be parsed by [JSON5](https://json5.org/).

### Format the whole file

```viml
:CocCommand formatJson [options]
```

See [options](#Options) section for more details.

### Format selected text

First make a selection with `v`. Then execute command:

```viml
:CocCommand formatJson.selected [options]
```

See [options](#Options) section for more details.

## Options

### --indent

`--indent=<number>`

Set indentation as `<number>` spaces. When `<number>` is zero, the JSON object will be serialized in compact mode, i.e. no extra white spaces will be kept.

### --quote

`--quote='`

Set the quote character to use, either `'` or `"`. In typical JSON only `"` is allowed, however in JavaScript it is common to use `'` everywhere.

### --quote-as-needed

`--quote-as-needed` or `--quote-as-needed=<true|false>`

While enabled, all quotes will be ommitted if possible, if only the serialized text is valid in JavaScript.

### --trailing

`--trailing` or `--trailing=<true|false>`

While enabled, an dangling comma will be added to the last entry in each array and object. This is useful in JavaScript so that you don't have to modify the last line before appending a new line.

### --template

`--template` or `--template=<true|false>`

While enabled, multiline strings will be serialized as template literals quoted with `` ` ``, instead of using escaped characters like `\n`.

## Presets

Some presets are available to set a group of options:

- `--preset-js`

  useful to use in JavaScript code, equivalent to `--quote=' --quote-as-needed --trailing --template`.

- `--preset-json`

  useful to use in JSON file, equivalent to `--quote=" --quote-as-needed=false --trailing=false --template=false`.
