Article = require('../models/article')
_ = require('lodash')

index = (req, res, next) ->
  Article.find {}, (err, articles) ->
    return next(err) if err
    res.render 'articles/index', { articles: articles }, (err, str) ->
      return next(err) if err
      res.send str

show = (req, res, next) ->
  Article.findOne { param_title: req.params.param_title }, (err, article) ->
    return next(err) if err
    res.render 'articles/show', article, (err, str) ->
      return next(err) if err
      res.send str

create = (req, res, next) ->
  # a = new Article()
  # a.title = 'Morning Fellas!'
  # a.body = 'Text and shiat'
  # a.updated = new Date()
  # a.save()
  # res.send 'Saved.'

module.exports =
  index: index
  show: show
