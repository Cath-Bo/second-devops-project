# Rollback Plan

1. Restore the original HTTP-only Nginx configuration for twoja.local.
2. Remove the HTTPS server block and the HTTP 301 redirect.
3. Remove the HSTS header.
4. Test the Nginx configuration:
   sudo nginx -t
5. Reload Nginx:
   sudo systemctl reload nginx

## What Cannot Be Reverted Immediately

- HSTS is cached by browsers until its max-age expires. It cannot be remotely removed immediately from every browser.
- HTTP 301 redirects may be cached by browsers and may continue to redirect clients.
