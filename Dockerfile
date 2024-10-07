FROM nginx:mainline-alpine-slim
COPY . /usr/share/nginx/html/
EXPOSE 80/tcp
