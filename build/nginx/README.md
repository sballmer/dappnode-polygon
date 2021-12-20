# Nginx reverse HTTP and WS proxy

## Dev

- Uses dummy HTTP and dummyws WS servers for testings
- Run: `docker-compose -f docker-compose.dev.yml up` 
- Build after change in config: `docker-compose -f docker-compose.dev.yml build nginx` 
- Test websocket:
  - `npm install wscat`
  - Use locally: `wscat --connect ws://localhost:10546`  
  - Use with Basic Auth: `wscat --connect ws://admin:12345@localhost:10646`     

## Description

- dummy HTTP server runs on port `8080` (replaced by bor internal port in prod) and exposes `10545` port externally  
- dummyws WS server runs on port `8010` (replaced by bor internal port in prod) and exposes `10546` port externally  
- Nginx listens on port `EXT_HTTP` and proxies HTTP trafic to port `INT_HTTP`  
- Nginx listens on port `EXT_WS` and proxies Websocket trafic to port `INT_WS`  
- `AUTH_USER` and `AUTH_PASSWORD` are used to generate `.htpasswd` required for Basic Auth  
- `WS_NAME` is the target service. Should be `bor` in production and `dummyws` in dev.  

Locally ports `10545` and `10546` are accessible and Basic auth is bypassed. Publicly, they are not and requests are going through Nginx on ports `EXT_HTTP` and `EXT_WS` respectivly with Basic Auth required.  
