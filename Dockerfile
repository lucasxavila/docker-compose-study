# ESTÁGIO 1: Build
FROM node:18-alpine3.19 AS build

WORKDIR /usr/src/app

# Copia arquivos de dependências primeiro para aproveitar o cache do Docker
COPY package*.json ./

RUN npm install

# Copia o restante do código e gera o build
COPY . .

RUN npm run build

# ESTÁGIO 2: Produção (Imagem Final)
FROM node:18-alpine3.19

WORKDIR /usr/src/app

# Copia apenas o que é essencial do estágio de build
COPY --from=build /usr/src/app/package*.json ./
COPY --from=build /usr/src/app/dist ./dist

RUN npm ci --only=production

# Requisito de Segurança: Define o usuário node para rodar a aplicação
USER node

EXPOSE 3000

# Execução direta do node para melhor performance e gestão de sinais (SIGTERM)
CMD ["node", "dist/main.js"]