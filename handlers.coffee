http = require 'http'

log = (srv, req) ->
	console.log "#{srv}: #{req.method} #{req.url} (#{JSON.stringify(req.headers)})"

rdr = http.createServer (req, res) =>
	log 'rdr', req
	res.writeHead 200,
		'Foo': 1
		'Bar': 2
		'X-Accel-Redirect': '/tgt'
	res.end()

tgt = http.createServer (req, res) =>
	log 'tgt', req
	res.end 'done'

rdr.listen 8081
tgt.listen 8082
