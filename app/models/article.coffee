mongoose = require('../../db')

Article = new mongoose.Schema
  title: String
  param_title: String
  body: String
  published: Date
  updated: Date

Article.pre 'save', (next) ->
  # Published articles do not change URL/param title
  if @published == undefined
    @param_title = @title.replace(/\s+/g, '-').toLowerCase().replace(/[^a-z-]/g, '')
  next()

Article.methods.publishedDate = ->
  (new Date(@published)).toDateString()

module.exports = mongoose.model('Article', Article)
