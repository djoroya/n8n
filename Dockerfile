# Dockerfile for n8n deployment on Coolify
# Build from official Node.js image s
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apk add --no-cache python3 make g++

# Copy package files and install dependencies
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install --frozen-lockfile

# Copy all source code
COPY . .

# Build n8n
RUN pnpm build

# Expose default n8n port
EXPOSE 5678

# Set environment variables for production
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV NODE_ENV=production

# Start n8n
CMD ["pnpm", "start"]
