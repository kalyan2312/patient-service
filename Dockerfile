# stage 1: build
FROM node:20-alpine AS builder
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
# if you have a build step (Typescript / bundler), run it here
# RUN npm run build


# stage 2: runtime
FROM node:20-alpine
WORKDIR /app
# create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app .
USER appuser
ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "main.js"]