var webpack = require('webpack');
var RemoveWebpackPlugin = require('./index');

module.exports = {
  plugins: [
    new RemoveWebpackPlugin(['./public/', './build/', './bla.js'])
  ]
};
