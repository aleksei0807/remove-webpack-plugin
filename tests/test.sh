#!/bin/sh
# public/', './build/', './bla.js
mkdir public
mkdir build
mkdir build_dir
touch bla.js
touch build.js

cp tests/configs/multiple_paths.js webpack.config.js
webpack
cp tests/configs/single_dir.js webpack.config.js
webpack
cp tests/configs/single_file.js webpack.config.js
webpack
