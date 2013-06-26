.PHONY: usage nginx handlers test

usage:
	echo 'run nginx with make nginx, handlers with make handlers, then test with make test'

nginx:
	nginx -c ${PWD}/nginx.conf

handlers:
	coffee handlers.coffee

test:
	curl -D/dev/stdout -A '' -H 'Accept:' -H 'hello: world' 127.0.0.1:8080

post:
	curl -D/dev/stdout -X POST --data-binary 'foo=bar'      127.0.0.1:8080
