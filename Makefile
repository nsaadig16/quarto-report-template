.PHONY: setup preview render clean

dependencies:
	@if command -v dnf > /dev/null 2>&1; then \
		rpm -q libxcrypt-compat || sudo dnf install -y libxcrypt-compat; \
	elif command -v apt > /dev/null 2>&1; then \
		dpkg -l libxcrypt-compat || sudo apt install -y libxcrypt-compat; \
	else \
		echo "Unsupported package manager. Please install libxcrypt-compat manually."; \
		exit 1; \
	fi
setup: dependencies
	uv sync ; \
	( quarto check install 2>&1 | grep TinyTex ) > /dev/null || quarto install tinytex 
preview: setup
	source .venv/bin/activate && quarto preview report.qmd --host 127.0.0.1 --port 7722 --quiet
render: setup
	source .venv/bin/activate && quarto render --to pdf
clean:
	rm -rf .venv .quarto uv.lock *.log *.tex output/*