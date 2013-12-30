UiComponent = require '../ui_component'
Link = require '../link'

class Article extends UiComponent
  components: ->
    [
      (new Link { url: '/', body: 'Back' }), '<br>',
      '<h3>', @scope.title, '</h3><p>', @scope.param_title, '</p>' ]

module.exports = Article
