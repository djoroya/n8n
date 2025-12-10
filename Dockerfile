FROM n8nio/n8n:1.68.0

# Set working directory
WORKDIR /home/node

# Expose n8n port
EXPOSE 5678

# Set environment variables with defaults
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV NODE_ENV=production

# Use the default entrypoint and command from the base image
CMD ["n8n"]
