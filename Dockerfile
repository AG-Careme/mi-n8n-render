FROM n8nio/n8n:latest

USER root

# Instalar PDF.co en la carpeta de community nodes
RUN mkdir -p /home/node/.n8n/nodes \
  && npm install --prefix /home/node/.n8n/nodes --production n8n-nodes-pdfco \
  && chown -R node:node /home/node/.n8n

USER node
