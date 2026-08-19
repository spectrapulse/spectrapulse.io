FROM nginxinc/nginx-unprivileged:mainline-alpine-slim
COPY . /usr/share/nginx/html/
EXPOSE 8080/tcp
