# syntax=docker/dockerfile:1.5

FROM node:19.4-bullseye AS build

# Specify working directory other than /
WORKDIR /usr/src/app

# Copy only files required to install
# dependencies (better layer caching)
COPY package*.json ./

# Use cache mount to speed up install of existing dependencies
RUN --mount=type=cache,target=/usr/src/app/.npm \
  npm set cache /usr/src/app/.npm && \
  npm ci

COPY . .

RUN npm run build

# Use separate stage for deployable image
FROM nginxinc/nginx-unprivileged@sha256:326b240af67b2c8134685b1e00a2a1ff2bc067a7a1d1c039262c1e01ba6b151e

# Use COPY --link to avoid breaking cache if we change the second stage base image
COPY --link nginx.conf /etc/nginx/conf.d/default.conf

COPY --link --from=build usr/src/app/build/ /usr/share/nginx/html

EXPOSE 8080