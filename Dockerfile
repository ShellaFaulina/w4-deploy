FROM node:20 AS base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

# TODO: code disini
ENV NUXT_STUDENT_NAME "Hello World\n${STUDENT_NAME}"
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}

# Set direktori kerja dalam container
WORKDIR /app

# Salin package.json dan package-lock.json untuk menginstal dependencies
COPY package*.json ./

# Instal dependencies
RUN npm install

# Salin seluruh kode sumber ke dalam container
COPY . .

# Build aplikasi untuk produksi
RUN npm run build

# Ekspos port yang digunakan oleh aplikasi (Vite menggunakan 5173 secara default)
EXPOSE 8080

# Perintah untuk menjalankan aplikasi
CMD ["npm", "start"]
