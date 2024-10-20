spawn-fcgi -a 127.0.0.1 -p 8080 -f ./a.out
nginx -g "daemon off;"
