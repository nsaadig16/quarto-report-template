.PHONY: setup preview render clean

setup:
	python -m venv .venv && source .venv/bin/activate ; \
	pip install -r requirements.txt --quiet --ignore-installed --disable-pip-version-check ; \
	quarto install tinytex --no-prompt
preview:
	source .venv/bin/activate && quarto preview report.qmd --host localhost --port 7722 --quiet
render:
	source .venv/bin/activate && quarto render --to pdf
clean:
	rm -rf .venv .quarto *.log *.tex output/*