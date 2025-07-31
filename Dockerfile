FROM node:18

# Instala dependências do sistema
RUN apt-get update && apt-get install -y python3 build-essential && rm -rf /var/lib/apt/lists/*

# Instala o n8n com suporte ao tunnel
RUN npm install -g n8n

# Cria diretório de dados
RUN mkdir -p /home/node/.n8n
WORKDIR /home/node

# Expõe a porta padrão
EXPOSE 5678

# Inicia com o tunnel
CMD ["n8n", "start", "--tunnel"]
