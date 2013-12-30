UiComponent = require './ui_component'

class Link extends UiComponent
  components: ->
    [ '<a href="', @scope.url, '">', @scope.body, '</a>' ]

module.exports = Link
