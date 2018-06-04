env:
	@python3 -m venv env

test:
	@pytest

deps:
	@pip install -r requirements.txt

deps-update:
	@pip install -r requirements-to-freeze.txt --upgrade
	@pip freeze > requirements.txt

deps-uninstall:
	@pip uninstall -yr requirements.txt
	@pip freeze > requirements.txt

clean:
	@find . -name '__pycache__' | xargs rm -rf

.PHONY: deps* clean
