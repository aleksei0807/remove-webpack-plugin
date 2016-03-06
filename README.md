# Remove Webpack Plugin

[![npm version](https://badge.fury.io/js/remove-webpack-plugin.svg)](https://badge.fury.io/js/remove-webpack-plugin)

[![NPM](https://nodei.co/npm/remove-webpack-plugin.png?downloads=true&downloadRank=true&stars=true)](https://nodei.co/npm/remove-webpack-plugin/)

[![wercker status](https://app.wercker.com/status/16bc0b80e4385b9d38ee4d2f742c962c/m "wercker status")](https://app.wercker.com/project/bykey/16bc0b80e4385b9d38ee4d2f742c962c)

Plugin for webpack to remove directorys or files. (`$ rm -r`)

### Installation

Install the plugin with npm:

```sh
$ npm install remove-webpack-plugin --save-dev
```

### Example Webpack Config

```javascript
var RemoveWebpackPlugin = require('remove-webpack-plugin');

module.exports = {
  plugins: [
    new RemoveWebpackPlugin(['./public/', './build/'])
  ]
}
```

### Usage

```javascript
new RemoveWebpackPlugin(paths)
```

### Paths

Array or String.

License
----

MIT
