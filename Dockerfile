# Usa l'immagine base di Node.js
FROM node:20

# Imposta la directory di lavoro all'interno del container
WORKDIR /app

# Copia i file di dipendenze nel container
COPY package*.json ./

# Installa le dipendenze
RUN npm install

# Copia tutto il codice del progetto nel container
COPY . .

# Costruisci il progetto per la produzione
RUN npm run build

# Esponi la porta 3000 per il front-end Next.js
EXPOSE 3000

# Comando per avviare l'applicazione
CMD ["npm", "start"]
