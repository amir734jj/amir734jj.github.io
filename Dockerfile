FROM debian AS build-env

WORKDIR /app

RUN apt-get update && apt install -y hugo

COPY . .

RUN hugo -D

# Build runtime image
FROM nginx:alpine

# Copy the static website
# Use the .dockerignore file to control what ends up inside the image!
COPY --from=build-env /app/public /data

COPY nginx.conf /etc/nginx/nginx.conf

RUN ls /data