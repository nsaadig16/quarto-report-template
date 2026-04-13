FROM ghcr.io/quarto-dev/quarto-full:1.9.37 AS base

# Dependencies
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
RUN uv python install 3.12

RUN tlmgr update --self && \
    tlmgr install \
    biblatex \
    biblatex-ieee \
    titling \
    titlesec \
    appendix \
    caption \
    biber && \
    tlmgr path add

WORKDIR /app

# Python dependencies
COPY uv.lock pyproject.toml ./
RUN uv sync --frozen --no-install-project

# Environment
ENV PATH="/app/.venv/bin:$PATH"
ENV QUARTO_PYTHON="/app/.venv/bin/python"

COPY . .

RUN python --version

# Preview
FROM base AS preview
EXPOSE 7866
CMD ["quarto", "preview", "report.qmd", "--host", "0.0.0.0", "--port", "7722", "--no-browser"]

# Render
FROM base AS render
CMD [ "quarto", "render", "report.qmd", "--to", "pdf"]