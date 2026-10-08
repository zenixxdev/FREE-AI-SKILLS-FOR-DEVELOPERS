---
name: "reverse-proxy-and-ssl-hardening"
description: "Configuring high-performance Nginx reverse proxies with modern TLS 1.3 encryption, HTTP/2, buffer tuning, rate limiting, and security headers."
category: "devops"
subcategory: "nginx"
language: "nginx"
framework: "none"
technology: "nginx"
difficulty: "intermediate"
tags: ["devops", "nginx", "reverse-proxy", "ssl", "tls", "http2", "security-headers"]
---

# Nginx Reverse Proxy Architecture and SSL/TLS Hardening

## Purpose
Instruct AI agents to author production-ready, security-hardened Nginx configurations providing high-throughput reverse proxying, modern TLS ciphers, and DDoS mitigation.

## When to Use
Use when configuring edge web servers, SSL termination proxies, API gateways, load balancers, or static asset caches.

## Inputs / Context
Backend upstream servers, domain names, SSL certificate paths, rate limit thresholds, and caching policies.

## Instructions
1. Modern SSL/TLS Hardening (Mozilla Intermediate/Modern Guideline):
   - Restrict protocols to `TLSv1.2 TLSv1.3`; disable obsolete SSLv3, TLS 1.0, and TLS 1.1.
   - Use high-security cipher suites prioritizing forward secrecy (ECDHE).
   - Configure SSL session caching: `ssl_session_cache shared:SSL:10m; ssl_session_timeout 1d; ssl_session_tickets off;`.
   - Enable OCSP Stapling: `ssl_stapling on; ssl_stapling_verify on; resolver 1.1.1.1 8.8.8.8;`.
2. Enable HTTP/2 Protocol: Include `http2` in the `listen 443 ssl` directive.
3. Enforce Strict Security Headers:
   - `add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload" always;`
   - `add_header X-Content-Type-Options "nosniff" always;`
   - `add_header X-Frame-Options "DENY" always;`
   - `add_header Referrer-Policy "strict-origin-when-cross-origin" always;`
4. Reverse Proxy Header Propagation:
   - Always propagate client IP and proto:
     `proxy_set_header Host $host;`
     `proxy_set_header X-Real-IP $remote_addr;`
     `proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;`
     `proxy_set_header X-Forwarded-Proto $scheme;`
5. Configure Upstream Connection Keep-Alive:
   - Maintain a pool of persistent connections to backend servers (`keepalive 32;` inside `upstream` block) and set `proxy_http_version 1.1; proxy_set_header Connection "";`.
6. Implement Edge Rate Limiting:
   - Configure `limit_req_zone $binary_remote_addr zone=api_limit:10m rate=10r/s;` and apply `limit_req zone=api_limit burst=20 nodelay;` on API routes.

## Constraints / Rules
- Never enable legacy SSLv2, SSLv3, TLS 1.0, or TLS 1.1.
- Never forward proxy requests without resetting the `Connection ""` header when using HTTP/1.1 keep-alives.
- Do not expose Nginx version numbers; set `server_tokens off;`.

## Workflow
1. Author global Nginx configuration with worker process auto-tuning.
2. Define upstream block with persistent keep-alive connections.
3. Configure HTTP to HTTPS 301 redirection block.
4. Configure HTTPS server block with TLS 1.3, security headers, and reverse proxy settings.
5. Test configuration syntax: `nginx -t`.
6. Reload Nginx without downtime: `nginx -s reload`.

## Expected Output
Production Nginx configuration file (`nginx.conf`) featuring TLS 1.3, HTTP/2, reverse proxy header forwarding, keep-alive pooling, and rate limiting.

## Validation Checklist
- [ ] Are obsolete TLS protocols disabled (TLS 1.2+ only)?
- [ ] Is HTTP/2 enabled on port 443?
- [ ] Are client IPs correctly forwarded via `X-Forwarded-For`?
- [ ] Is HSTS and standard security headers configured?
- [ ] Does `nginx -t` validate with zero syntax warnings?

## Common Mistakes & Antipatterns
- Omitting `proxy_set_header Connection ""` when proxying HTTP/1.1, causing Nginx to close upstream connections on every single request instead of reusing them.
- Leaving `server_tokens on;`, leaking exact Nginx version information in HTTP headers to potential attackers.
- Forgetting to configure an HTTP-to-HTTPS redirect, leaving unencrypted HTTP traffic open.

## Concrete Real-World Example
Scenario: An Nginx proxy drops client IP addresses, exposes internal backend server ports, and suffers from connection overhead under high load.
Prompt: Write a hardened, high-performance Nginx configuration for proxying traffic to a backend cluster on port 3000.
Application: The AI creates an upstream block with `keepalive 64`, sets `server_tokens off`, enforces modern TLS 1.3 ciphers, adds HSTS and CSP headers, forwards `X-Real-IP` and `X-Forwarded-For`, and configures an edge rate-limiting zone with burst handling.
