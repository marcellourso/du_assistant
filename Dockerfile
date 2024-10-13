# Usa una versione leggera di Node.js (alpine)
FROM node:20-alpine

# Imposta la directory di lavoro all'interno del container
WORKDIR /app

# Copia i file package.json e package-lock.json per installare le dipendenze
COPY package*.json ./

# Installa solo le dipendenze necessarie per la produzione
RUN npm install --only=production

# Copia tutto il resto del codice sorgente nella directory di lavoro del container
COPY . .

# Copia il file .env nel container (in locale deve essere presente nella root del progetto)
COPY .env .env

# Imposta il file .env per l'uso nell'app (in Node.js puoi usare dotenv)
RUN npm install dotenv

# Costruisci il progetto per la produzione (se necessario)
RUN npm run build

# Esponi la porta 3000 per la tua applicazione React
EXPOSE 3000

# Avvia l'applicazione
CMD ["npm", "start"]

