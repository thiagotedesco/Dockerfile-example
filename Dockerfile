# Usa a imagem base mais recente do Nginx disponível no Docker Hub
FROM nginx:latest

# Cria o diretório /var/www/html e quaisquer diretórios pai necessários
RUN mkdir -p /var/www/html

# Define uma variável de ambiente NGINX_CONF com o caminho do arquivo de configuração do Nginx
ENV NGINX_CONF /etc/nginx/conf.d/default.conf

# Copia o arquivo nginx.conf do diretório local para o caminho especificado pela variável de ambiente NGINX_CONF
COPY ./nginx.conf $NGINX_CONF

# Adiciona o conteúdo do diretório ./app no sistema de arquivos local para o diretório /var/www/html/site no container
ADD ./app /var/www/html/site

# Informa ao Docker que o container escuta na porta 80 em tempo de execução
EXPOSE 80

# Adiciona uma descrição à imagem Docker como metadado
LABEL description="VIA CEP DOCKER"
