FROM inveracity/hugo:0.115.2 as builder

WORKDIR /srv/hugo
COPY . .

RUN /hugo

FROM nginx:alpine

COPY --from=builder /srv/hugo/public/ /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
