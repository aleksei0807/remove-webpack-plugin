/*
	MIT License http://www.opensource.org/licenses/mit-license.php
	Author Aleksey Shchurack
*/

var fs = require('fs');
var rimraf = require('rimraf');

function deletePath(path) {
	process.stdout.write(path + ': deleted');
	try {

		fs.accessSync(path, fs.F_OK);
		rimraf.sync(path);
		console.log('\033[32;01m ✔\033[0m');

	} catch (err) {
		console.log('\033[31;01m ✖\033[0m');
		console.error('RemoveWebpackPlugin \033[31;01m' + err + '\033[0m');
	}
}

function RemoveWebpackPlugin(paths) {
	if (typeof paths == 'string') {

		deletePath(paths);

	} else if (paths instanceof Array) {

		var len = paths.length;
		for (var i = 0; i < len; i++) {
			deletePath(paths[i]);
		}

	} else {

		console.error('RemoveWebpackPlugin \033[31;01mError: argument not valid!\033[0m');
		return false;

	}
}

RemoveWebpackPlugin.prototype.apply = function(compiler) {

};

module.exports = RemoveWebpackPlugin;
