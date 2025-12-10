# n8n Deployment

Este repositorio contiene la configuración para desplegar n8n usando Docker y Coolify.

## 🚀 Despliegue en Coolify

### Configuración Rápida

1. **Conecta el repositorio** en Coolify
2. **Configura las variables de entorno** necesarias
3. **Despliega** automáticamente

### Variables de Entorno Requeridas

```bash
# Requerido: Clave de encriptación (genera una con: openssl rand -base64 32)
N8N_ENCRYPTION_KEY=tu-clave-de-encriptacion-aqui

# Requerido: URL de tu dominio en Coolify
WEBHOOK_URL=https://tu-dominio.com
```

### Variables de Entorno Opcionales

```bash
# Puerto (por defecto: 5678)
N8N_PORT=5678

# Protocolo (por defecto: http, usar https en producción)
N8N_PROTOCOL=https

# Autenticación básica
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=tu-password-seguro
```

## 🐳 Despliegue Local con Docker

### Opción 1: Docker Run

```bash
docker build -t n8n-custom .
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -e N8N_ENCRYPTION_KEY="$(openssl rand -base64 32)" \
  -e WEBHOOK_URL="http://localhost:5678" \
  -v n8n_data:/home/node/.n8n \
  n8n-custom
```

### Opción 2: Docker Compose

```bash
# Copia el archivo de ejemplo de variables de entorno
cp .env.example .env

# Edita .env con tus valores
nano .env

# Inicia los servicios
docker-compose up -d

# Ver logs
docker-compose logs -f

# Detener
docker-compose down
```

## 📝 Configuración en Coolify

1. **Importar repositorio**: Conecta este repositorio de GitHub a Coolify
2. **Tipo de aplicación**: Detectará automáticamente el Dockerfile
3. **Puerto**: Configura el puerto 5678
4. **Variables de entorno**: Añade las variables necesarias en el panel de Coolify
5. **Dominio**: Configura tu dominio personalizado
6. **SSL**: Habilita HTTPS automático con Let's Encrypt

## 🔒 Seguridad

- **Siempre** configura `N8N_ENCRYPTION_KEY` con un valor seguro
- En producción, usa `N8N_PROTOCOL=https`
- Considera habilitar autenticación básica o configurar un proxy reverso
- Para datos sensibles, usa PostgreSQL en lugar de SQLite

## 📚 Documentación

- [n8n Documentation](https://docs.n8n.io/)
- [Coolify Documentation](https://coolify.io/docs)
- [Environment Variables](https://docs.n8n.io/hosting/configuration/environment-variables/)

## 🛠️ Troubleshooting

### Ver logs en Docker
```bash
docker logs -f <container-id>
```

### Reiniciar el contenedor
```bash
docker restart <container-id>
```

### Acceder al contenedor
```bash
docker exec -it <container-id> /bin/sh
```
