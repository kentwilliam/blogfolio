config = require './config'
express = require 'express'
app = express()

app.use express.logger()
app.use express.compress()
app.use express.methodOverride()
app.use express.json()
app.use express.urlencoded()

app.set 'view engine', 'coffee'
app.set 'views', __dirname + '/app/ui_components'
app.engine 'coffee', (path, scope, callback) ->
  UiComponent = require(path)
  (new UiComponent(scope)).page(callback)

app.listen config.httpPort, ->
  console.log 'Listening on port ' + config.httpPort

require('./app/routes')(app)
