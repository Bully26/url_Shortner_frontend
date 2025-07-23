FROM node:latest AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev

COPY . .

FROM node:latest

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app .
ENV CHOKIDAR_USEPOLLING=true
EXPOSE 3000

CMD ["npm","run","dev"] 
