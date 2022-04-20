setup:
	# Create python virtualenv & activate
	python3 -m venv ~/.devops
	source ~/.devops/bin/activate

install:
	# run from inside the virtualenv
	pip install --upgrade pip && pip install -r requirements.txt
	#wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && chmod +x /bin/hadolint

test:
	# tests go here, not yet prepared
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb
	
env:
	# lists information about the enironment
	which python3
	python3 --version
	which pytest
	which pylint

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# run from inside from within the virtual env!
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test
