FROM node:14.19.3-slim
ENV NODE_ENV=production
WORKDIR /app
COPY ["package.json", "package-lock.json", "./"]
RUN npm install --production
COPY . .
CMD ["node", "server.js"]