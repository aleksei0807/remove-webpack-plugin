const fs = require("fs");
const assert = require("chai").assert;
const cmd = require("node-cmd");

describe('remove-webpack-plugin', () => {
	before(() => {
		if (!fs.existsSync("public")){
			fs.mkdirSync("public");
		}
		if (!fs.existsSync("build")){
			fs.mkdirSync("build");
		}
		if (!fs.existsSync("build_dir")){
			fs.mkdirSync("build_dir");
		}
		fs.writeFileSync("bla.js", "");
		fs.writeFileSync("build.js", "");
		if (!fs.existsSync("public")
			|| !fs.existsSync("build")
			|| !fs.existsSync("build_dir")
			|| !fs.existsSync("bla.js")
			|| !fs.existsSync("build.js")) {
			throw new Error("could not create a file or directory in before callback!");
		}
	});

	it('delete single file build.js', () => {
		cmd.get("webpack --config=tests/configs/single_file.js", () => {
			assert.isFalse(fs.existsSync("build.js"));
		});
	});

	it('delete single directory build_dir', () => {
		cmd.get("webpack --config=tests/configs/single_dir.js", () => {
			assert.isFalse(fs.existsSync("build_dir"));
		});
	});

	it('delete multiple files and directories', () => {
		cmd.get("webpack --config=tests/configs/multiple_paths.js", () => {
			assert.isFalse(fs.existsSync("public"));
			assert.isFalse(fs.existsSync("build"));
			assert.isFalse(fs.existsSync("bla.js"));
		});
	});

	after(() => {
		fs.rmdirSync("public");
		fs.rmdirSync("build");
		fs.rmdirSync("build_dir");
		fs.unlinkSync("bla.js");
		fs.unlinkSync("build.js");
	});
});
