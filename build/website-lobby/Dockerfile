FROM node:22 AS builder
WORKDIR /build
COPY . ./
RUN npm install
RUN npm run build

FROM node:22-alpine3.18
ARG GIT_COMMIT_HASH="undefined"
ARG SERVER_ORIGIN="http://localhost:3001"
ARG NODE_PORT=3001
ENV GIT_COMMIT_HASH=$GIT_COMMIT_HASH
ENV PORT=$NODE_PORT
ENV ORIGIN=$SERVER_ORIGIN
WORKDIR /app
COPY --from=builder build/build bin/
COPY --from=builder build/package.json bin/
WORKDIR /app/bin
CMD ["node", "."]
