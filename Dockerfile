# FROM node:14.19.3-slim
# ENV NODE_ENV=production
# WORKDIR /app
# COPY ["package.json", "package-lock.json", "./"]
# RUN npm install --production
# COPY . .
# CMD ["node", "server.js"]

FROM node:14.19.3-slim as base
WORKDIR /code
COPY package.json package.json
COPY package-lock.json package-lock.json

FROM base as test
RUN npm ci
COPY . .
RUN npm run test

FROM base as prod
RUN npm ci --production
COPY . .
CMD ["node", "server.js"]
