var webpack = require('webpack');
var RemoveWebpackPlugin = require('./index');

module.exports = {
  plugins: [
    new RemoveWebpackPlugin('./build/')
  ]
};
