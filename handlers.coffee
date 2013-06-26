http = require 'http'

log = (srv, req) ->
	console.log "#{srv}: #{req.method} #{req.url} (#{JSON.stringify(req.headers)})"

rdr = http.createServer (req, res) =>
	log 'rdr', req
	req.on 'data', (data)->
		console.log "rdr data: #{data}"
	res.writeHead 200,
		'Foo': 1
		'Bar': 2
		'X-Accel-Redirect': '/tgt'
	res.end()

tgt = http.createServer (req, res) =>
	log 'tgt', req
	req.on 'data', (data)->
		console.log "tgt data: #{data}"
	res.end 'done'

rdr.listen 8081
tgt.listen 8082
