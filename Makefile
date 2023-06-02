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
	
secret: venv/
	source venv/Scripts/activate
	python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"

.PHONY: format
.PHONY: flake8
.PHONY: clean
.PHONY: venv
.PHONY: runserver
