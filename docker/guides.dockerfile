FROM python:3.13-slim AS builder

RUN pip install zensical

WORKDIR /guides

COPY zensical.toml .
COPY docs ./docs

RUN zensical build

FROM nginx:alpine

COPY --from=builder /guides/site /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
