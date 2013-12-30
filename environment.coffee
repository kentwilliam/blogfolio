config     = require './config'
express    = require 'express'

app = express()

app.use express.logger()
app.use express.compress()
app.use express.methodOverride()
app.use express.json()
app.use express.urlencoded()

# Handlebars
handlebars = require 'express3-handlebars'
app.engine 'handlebars', handlebars { defaultLayout: 'main', layoutsDir: 'app/views/layouts', partialsDir: 'app/views/partials' }
app.set 'view engine', 'handlebars'
app.set 'views', __dirname + '/app/views'

# Stylus & nib
stylus = require 'stylus'
nib = require 'nib'
app.use stylus.middleware {
  src: __dirname + '/app/views/styles',
  dest: __dirname + '/public',
  compile: (str, path) ->
    stylus(str)
      .set('filename', path)
      .set('compress', true)
      .use(nib())
      .import('nib')
}

# Static assets
app.use express.static(__dirname + '/public')

app.listen config.httpPort, ->
  console.log 'Listening on port ' + config.httpPort

require('./app/routes')(app)
