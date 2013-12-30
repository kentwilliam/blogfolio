articles = require './controllers/articles'
notFound = require './controllers/not_found'
errors   = require './controllers/errors'

module.exports = (app) ->
  app.get '/', articles.index
  app.get '/posts/:param_title', articles.show

  app.use notFound
  app.use errors.default
