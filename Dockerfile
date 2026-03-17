# Gunakan image Node.js versi terbaru
FROM node:20

# Buat direktori kerja di dalam container
WORKDIR /app

# Salin package.json dan install dependencies
COPY package*.json ./
RUN npm install

# Salin seluruh kode game ke dalam container
COPY . .

# Berikan izin akses ke folder kerja
RUN chmod -R 777 /app

# Ekspos port yang akan digunakan (Hugging Face default menggunakan 7860)
EXPOSE 7860

# Jalankan aplikasi dengan environment PORT 7860
ENV PORT=7860
CMD ["node", "backend.js"]
