NO_COLOR="\033[0m"
OK_COLOR="\033[32;01m"
ERROR_COLOR="\033[31;01m"
WARN_COLOR="\033[33;01m"

OK_STRING=$(OK_COLOR)[OK]$(NO_COLOR)
ERROR_STRING=$(ERROR_COLOR)[ERRORS]$(NO_COLOR)
WARN_STRING=$(WARN_COLOR)[WARNINGS]$(NO_COLOR)

ERROR="0"
ZERO="0"

# AWK_CMD = awk '{ printf "%-30s %-10s\n",$$1, $$2; }'
# PRINT_ERROR = printf "$@ $(ERROR_STRING)\n" | $(AWK_CMD) && printf "$(CMD)\n$$LOG\n" && false
# PRINT_WARNING = printf "$@ $(WARN_STRING)\n" | $(AWK_CMD) && printf "$(CMD)\n$$LOG\n"
# PRINT_OK = printf "$@ $(OK_STRING)\n" | $(AWK_CMD)
# BUILD_CMD = LOG=$$($(CMD) 2>&1) ; if [ $$? -eq 1 ]; then $(PRINT_ERROR); elif [ "$$LOG" != "" ] ; then $(PRINT_WARNING); else $(PRINT_OK); fi;

test:
	mkdir public
	mkdir build
	mkdir build_dir
	touch bla.js
	touch build.js

	echo multiple_paths test;
	echo ==PREPARING==;
	cp tests/configs/multiple_paths.js webpack.config.js

	echo ==RUN==;
	webpack --output-filename=outputfile.js > /dev/null
	if [ -e public ] ; \
	then \
		echo dir "public" was not deleted; \
		echo multiple_paths test - $(ERROR_COLOR)[fail]$(NO_COLOR) \
		ERROR="1"; \
	else \
	    echo dir "public" was deleted; \
	fi;

	if [ -e build ] ; \
	then \
		echo dir "build" was not deleted; \
		echo multiple_paths test - $(ERROR_COLOR)[fail]$(NO_COLOR) \
		ERROR="1"; \
	else \
	    echo dir "build" was deleted; \
	fi;

	if [ -e bla.js ] ; \
	then \
		echo file "bla.js" was not deleted; \
		echo multiple_paths test - $(ERROR_COLOR)[fail]$(NO_COLOR) \
		ERROR="1"; \
	else \
	    echo file "bla.js" was deleted; \
	fi;

	if [ $(ERROR) != "0" ] ; \
	then \
		echo multiple_paths test - $(ERROR_COLOR)[fail]$(NO_COLOR); \
	else \
		echo multiple_paths test - $(OK_COLOR)[pass]$(NO_COLOR); \
	fi;


	echo single_dir test;
	echo ==PREPARING==;
	ERROR="0";

	cp tests/configs/single_dir.js webpack.config.js

	echo ==RUN==;
	webpack --output-filename=outputfile.js > /dev/null

	if [ -e build_dir ] ; \
	then \
		echo dir "build_dir" was not deleted; \
		echo single_dir test - $(ERROR_COLOR)[fail]$(NO_COLOR) \
		ERROR="1"; \
	else \
		echo dir "build_dir" was deleted; \
	fi;
	if [ $(ERROR) != "0" ] ; \
	then \
		echo single_dir test - $(ERROR_COLOR)[fail]$(NO_COLOR); \
	else \
		echo single_dir test - $(OK_COLOR)[pass]$(NO_COLOR); \
	fi;


	cp tests/configs/single_file.js webpack.config.js
	webpack --output-filename=outputfile.js > /dev/null

	if [ -e build.js ] ; \
	then \
		echo file "build.js" was not deleted; \
		echo single_file test - $(ERROR_COLOR)[fail]$(NO_COLOR) \
		ERROR="1"; \
	else \
		echo file "build.js" was deleted; \
	fi;

	if [ $(ERROR) != "0" ] ; \
	then \
		echo single_file test - $(ERROR_COLOR)[fail]$(NO_COLOR); \
	else \
		echo single_file test - $(OK_COLOR)[pass]$(NO_COLOR); \
	fi;

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
