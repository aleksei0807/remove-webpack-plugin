test:
	mkdir public
	mkdir build
	mkdir build_dir
	touch bla.js
	touch build.js

	cp tests/configs/multiple_paths.js webpack.config.js
	webpack --output-filename=outputfile.js
	cp tests/configs/single_dir.js webpack.config.js
	webpack --output-filename=outputfile.js
	cp tests/configs/single_file.js webpack.config.js
	webpack --output-filename=outputfile.js

clean:
	if [ -e public ] ; \
	then \
		rm -r public ; \
	fi;
	if [ -e build ] ; \
	then \
		rm -r build ; \
	fi;
	if [ -e build_dir ] ; \
	then \
		rm -r build_dir ; \
	fi;
	if [ -e bla.js ] ; \
	then \
		rm -r bla.js ; \
	fi;
	if [ -e build.js ] ; \
	then \
		rm -r build.js ; \
	fi;
