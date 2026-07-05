.PHONY: test

PYTHON ?= python3

test:
	bash code/check_shell_syntax.sh
	$(PYTHON) -m compileall code
