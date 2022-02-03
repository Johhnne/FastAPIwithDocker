# FROM python:3.9 as requirements-stage

# WORKDIR /tmp

# RUN pip install poetry
# RUN poetry config virtualenvs.create false
# #RUN POETRY_VIRTUALENVS_CREATE=false poetry install

# COPY ./pyproject.toml ./poetry.lock* /tmp/

# RUN poetry export -f requirements.txt --output requirements.txt --without-hashes

FROM python:3.9

ARG MY_ENV

ENV MY_ENV=${MY_ENV} \
  PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=1.0.0

RUN pip install "poetry==${POETRY_VERSION}"

WORKDIR /code

COPY poetry.lock pyproject.toml /code/

# COPY --from=requirements-stage /tmp/requirements.txt /code/requirements.txt

# RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

RUN poetry config virtualenvs.create false \
  && poetry install $(test "$YOUR_ENV" == production && echo "--no-dev") --no-interaction --no-ansi

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]