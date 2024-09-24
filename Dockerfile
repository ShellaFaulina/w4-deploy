FROM node:20 AS base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

WORKDIR /app

# Copy package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy seluruh file aplikasi
COPY . .

# Build the project
RUN npm run build

# Expose port 80 (port aplikasi Nuxt)
EXPOSE 3000

# Command to run the application
CMD ["npm", "run", "preview", "--port", "80"]
