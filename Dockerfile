# Usa la imagen oficial de n8n como base
FROM n8nio/n8n:latest

# Cambiamos a root para poder instalar paquetes
USER root

# Instalamos el nodo PDF.co en la carpeta de community nodes
RUN mkdir -p /home/node/.n8n/nodes \
  && npm install --prefix /home/node/.n8n/nodes --production n8n-nodes-pdfco \
  && chown -R node:node /home/node/.n8n

# Regresamos al usuario node (como hace la imagen oficial)
USER node

# Comando de inicio por defecto de n8n
CMD ["n8n", "start"]
