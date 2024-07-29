## infra environment
# depoyment location
location              = "centralus"
environment_name      = "hello"
api_app_image         = "ghcr.io/crossid/hello-fastapi:v0.0.3"
ui_app_image          = "ghcr.io/crossid/hello-nextjs:v0.0.4"
cloudflare_app_image  = "cloudflare/cloudflared:2024.6.1"
cloudflared_tunnel_id = "<uuid>.json"
