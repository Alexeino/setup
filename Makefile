.ONESHELL:

format:
	python -m black src/

flake8:
	python -m flake8 src/

clean:
	rm -rf .pytest_cache
	rm -rf src/.pytest_cache

venv:
	virtualenv venv
	source venv/Scripts/activate
	pip install -r requirements.txt


runserver: venv/
	venv/Scripts/python src/manage.py runserver


.PHONY: format
.PHONY: flake8
.PHONY: clean
.PHONY: venv
.PHONY: runserver