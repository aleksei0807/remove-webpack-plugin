# Remove Webpack Plugin

Plugin for webpack to remove directorys or files. ($ rm -r)

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
