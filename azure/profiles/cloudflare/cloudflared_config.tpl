tunnel: ${TUNNEL_ID}
credentials-file: /etc/cloudflared/${TUNNEL_ID}.json

ingress:
  - hostname: "*"
    service: https://${UI_SERVICE_URL}
    path: /ui/*
    originRequest:
      noTLSVerify: true
      httpHostHeader: ${UI_SERVICE_URL}
  - hostname: "*"
    service: https://${API_SERVICE_URL}
    path: /api/*
    originRequest:
      noTLSVerify: true
      httpHostHeader: ${API_SERVICE_URL}
  - hostname: "*"
    service: https://${API_SERVICE_URL}
    path: /docs/*
    originRequest:
      noTLSVerify: true
      httpHostHeader: ${API_SERVICE_URL}
  - hostname: "*"
    service: https://${API_SERVICE_URL}
    path: /openapi.json
    originRequest:
      noTLSVerify: true
      httpHostHeader: ${API_SERVICE_URL}
  - service: http_status:404
