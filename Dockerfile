FROM python:3.11-slim

WORKDIR /app

COPY pyproject.toml poetry.lock /app/

RUN pip install --no-cache-dir poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi --only main

COPY ./app /app/app/

EXPOSE 8000

ENTRYPOINT ["fastapi", "run", "app/src/main.py", "--port", "8000"]