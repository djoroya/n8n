FROM n8nio/n8n:stable

# Set working directory
WORKDIR /home/node

# Expose n8n port
EXPOSE 5678

# Set environment variables with defaults
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV NODE_ENV=production

# No need to override CMD or ENTRYPOINT, use the defaults from base image
