# Etapa 1: Build
FROM node:22 AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Etapa 2: Producción con Docker CLI
FROM node:22-alpine
RUN apk add --no-cache docker-cli
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/dist ./dist
COPY package*.json ./
RUN npm install --omit=dev
EXPOSE 4000
CMD ["node", "dist/main.js"]
