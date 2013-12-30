Link = require '../link'
UiComponent = require '../ui_component'
_ = require 'lodash'

class Articles extends UiComponent
  components: ->
    articles = @articles()
    articles.unshift '<h2>Articles.</h2>'
    articles

  articles: ->
    _.map @scope.articles, (a) -> new Article(a)

class Article extends UiComponent
  components: ->
    [ '<h3>',
        new Link({ url: ('/' + @scope.param_title), body: @scope.title }),
      '</h3><p>',
        @scope.body,
      '</p>' ]

module.exports = Articles
