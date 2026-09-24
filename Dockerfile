FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="CodeAlpha Docker Web Server" \
      org.opencontainers.image.description="A small static web server for CodeAlpha DevOps Task 4"

COPY site/ /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1/health.html || exit 1
