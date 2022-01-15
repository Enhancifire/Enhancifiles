# @gera2ld/format-json

![NPM](https://img.shields.io/npm/v/@gera2ld/format-json.svg)
![License](https://img.shields.io/npm/l/@gera2ld/format-json.svg)
![Downloads](https://img.shields.io/npm/dt/@gera2ld/format-json.svg)

Format JSON in different flavors.

## Features

- Format as JSON or JavaScript, either compact or indented
- Highlight nodes by changing the output on render

## Installation

```sh
$ yarn add @gera2ld/format-json
```

## Usage

```js
import { format, ItemTypes } from '@gera2ld/format-json';

const data = {/* … */};
const jsonOptions = {
  indent: 0,
  quoteAsNeeded: false,
  quote: '"',
  trailing: false,
  template: false,
};
console.log('format as JSON:', format(data, jsonOptions));

const jsOptions = {
  indent: 2,
  quoteAsNeeded: true,
  quote: '\'',
  trailing: true,
  template: true,
};
console.log('format as JavaScript', format(data, jsOptions));

const highlightOptions = {
  onData(item) {
    // if the property name is 'highlight', wrap it with `<em>...</em>`
    if (item.path[item.path.length - 1] === 'highlight' && item.type === ItemTypes.KEY) {
      item.data = [
        { value: '<em>' },
        ...item.data,
        { value: '</em>' },
      ];
    }
  },
};
console.log('highlight values', format(data, highlightOptions));
```
