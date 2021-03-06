# Stage 0: compile angular frontend
FROM node:alpine AS builder
WORKDIR /app
COPY . .
RUN npm install && \
npm run build
FROM nginx:alpine
COPY --from=builder /app/dist/* /usr/share/nginx/html/
EXPOSE 4200 80
