# Use uma imagem base leve do Node.js baseada em Alpine Linux
FROM node:14-alpine

# Defina variáveis de ambiente para evitar mensagens de aviso
ENV NODE_ENV=production

# Crie um diretório para a aplicação e defina o diretório de trabalho
WORKDIR /usr/src/app

# Copie apenas os arquivos package.json e package-lock.json primeiro
COPY app/package*.json ./

# Instale as dependências de produção
RUN npm ci --only=production

# Copie o restante do código da aplicação
COPY app .

# Altere o proprietário dos arquivos para um usuário não root
RUN chown -R node:node /usr/src/app

# Execute a aplicação com um usuário não root
USER node

# Exponha a porta que a aplicação vai usar
EXPOSE 8090

# Comando para iniciar a aplicação
CMD ["node", "app.js"]
