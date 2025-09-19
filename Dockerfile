# Partimos de la imagen oficial de n8n
FROM n8nio/n8n:latest

# Cambiamos a root para instalar paquetes
USER root

# Instalar el nodo PDF.co en la carpeta de community nodes
RUN mkdir -p /home/node/.n8n/nodes \
  && npm install --prefix /home/node/.n8n/nodes --production n8n-nodes-pdfco \
  && chown -R node:node /home/node/.n8n

# Regresamos al usuario normal (node)
USER node
