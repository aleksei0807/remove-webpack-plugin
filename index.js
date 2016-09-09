/*
	MIT License http://www.opensource.org/licenses/mit-license.php
	Author Aleksey Shchurack
*/

var fs = require('fs');
var rimraf = require('rimraf');
var validol = require('validol');

function deletePath(path, settings) {
	process.stdout.write(path + ': deleted');
	try {

		fs.accessSync(path, fs.F_OK);
		rimraf.sync(path);
		console.log('\033[32;01m ✔\033[0m');

	} catch (err) {
		console.log('\033[31;01m ✖\033[0m');
		var errors = 'show';
		if (settings) {
			if (typeof settings === 'object') {
				errors = validol(settings, 'errors', 'show').result.errors;
			}
			if (typeof settings === 'string') {
				errors = settings;
			}
		}
		if (errors === 'show') {
			console.error('RemoveWebpackPlugin \033[31;01m' + err + '\033[0m');
		}
		if (errors === 'fatal') {
			throw new Error('RemoveWebpackPlugin: ' + err);
		}
	}
}

function RemoveWebpackPlugin(paths, settings) {
	if (typeof paths == 'string') {

		deletePath(paths, settings);

	} else if (paths instanceof Array) {

		var len = paths.length;
		for (var i = 0; i < len; i++) {
			deletePath(paths[i], settings);
		}

	} else {

		console.error('RemoveWebpackPlugin \033[31;01mError: argument not valid!\033[0m');
		return false;

	}
}

RemoveWebpackPlugin.prototype.apply = function(compiler) {

};

module.exports = RemoveWebpackPlugin;
