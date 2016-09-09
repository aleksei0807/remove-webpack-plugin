# Remove Webpack Plugin

[![npm version](https://badge.fury.io/js/remove-webpack-plugin.svg)](https://badge.fury.io/js/remove-webpack-plugin)

[![NPM](https://nodei.co/npm/remove-webpack-plugin.png?downloads=true&downloadRank=true&stars=true)](https://nodei.co/npm/remove-webpack-plugin/)

[![wercker status](https://app.wercker.com/status/16bc0b80e4385b9d38ee4d2f742c962c/m "wercker status")](https://app.wercker.com/project/bykey/16bc0b80e4385b9d38ee4d2f742c962c)
[![Package Quality](http://npm.packagequality.com/badge/remove-webpack-plugin.png)](http://packagequality.com/#?package=remove-webpack-plugin)

Plugin for webpack to remove directorys or files. (`rm -r`)

### Installation

Install the plugin with npm:

```sh
npm install remove-webpack-plugin --save-dev
```

### Examples Webpack Config

```javascript
var RemoveWebpackPlugin = require('remove-webpack-plugin');

module.exports = {
  plugins: [
    new RemoveWebpackPlugin('./public/')
  ]
}
```

```javascript
var RemoveWebpackPlugin = require('remove-webpack-plugin');

module.exports = {
  plugins: [
    new RemoveWebpackPlugin(['./public/', './build/'], )
  ]
}
```

```javascript
var RemoveWebpackPlugin = require('remove-webpack-plugin');

module.exports = {
  plugins: [
    new RemoveWebpackPlugin(['./public/', './build/'], 'show')
  ]
}
```

```javascript
var RemoveWebpackPlugin = require('remove-webpack-plugin');

module.exports = {
  plugins: [
    new RemoveWebpackPlugin(['./public/', './build/'], 'hide')
  ]
}
```

```javascript
var RemoveWebpackPlugin = require('remove-webpack-plugin');

module.exports = {
  plugins: [
    new RemoveWebpackPlugin(['./public/', './build/'], 'fatal')
  ]
}
```

```javascript
var RemoveWebpackPlugin = require('remove-webpack-plugin');

module.exports = {
  plugins: [
    new RemoveWebpackPlugin(['./public/', './build/'], {
		errors: 'hide'
	})
  ]
}
```

```javascript
var RemoveWebpackPlugin = require('remove-webpack-plugin');

module.exports = {
  plugins: [
    new RemoveWebpackPlugin(['./public/', './build/'], {
		errors: 'show'
	})
  ]
}
```

```javascript
var RemoveWebpackPlugin = require('remove-webpack-plugin');

module.exports = {
  plugins: [
    new RemoveWebpackPlugin(['./public/', './build/'], {
		errors: 'fatal'
	})
  ]
}
```

### Usage

```javascript
new RemoveWebpackPlugin(paths, ?settings)
```

### Params

- paths: Array || String
- errors/settings: String("show" || "hide" || 'fatal')/Object{ errors: "show" || "hide" || "fatal"}
default: "show"

License
----

MIT
