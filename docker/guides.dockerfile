FROM python:3.14-slim AS builder

COPY docker/requirements.out.txt requirements.txt
RUN pip install -r requirements.txt

WORKDIR /guides

COPY zensical.toml .
COPY docs ./docs

RUN zensical build

FROM nginx:alpine

COPY --from=builder /guides/site /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
