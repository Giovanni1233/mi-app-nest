# Dockerfile para node con Docker CLI
FROM node:22-alpine

# Instalar Docker CLI
RUN apk add --no-cache docker-cli

# Establecer directorio de trabajo
WORKDIR /usr/src/app

# Copiar package.json para instalar dependencias (opcional)
COPY package*.json ./

RUN npm install

# Copiar el resto de archivos (opcional, dependiendo de tu necesidad)
COPY . .

EXPOSE 4000
# Comando por defecto (puedes cambiarlo si quieres)
CMD ["node", "dist/main.js","npm", "run", "start:prod","sh"]