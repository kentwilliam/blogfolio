Article = require '../models/article'
_       = require 'lodash'

index = (req, res, next) ->
  Article.find { published: { '$ne': null } }, (err, articles) ->
    render err, { articles: articles }, req, res, next

show = (req, res, next) ->
  Article.findOne { param_title: req.params.param_title }, (err, article) ->
    render err, { articles: [ article ] }, req, res, next

render = (err, data, req, res, next) ->
  return next(err) if err
  res.render 'articles', data, (err, str) ->
    return next(err) if err
    res.send str

module.exports =
  index: index
  show: show
