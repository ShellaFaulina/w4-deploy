FROM node:20 AS base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Expose port 3000 
EXPOSE 3000

# Build the project
RUN npm run build

# Command to run the application
CMD ["npm", "start"]
