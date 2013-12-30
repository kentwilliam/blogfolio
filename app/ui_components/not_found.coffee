UiComponent = require('./ui_component')

class NotFound extends UiComponent
  components: ->
    [ '<h2>Sorry, but the document could not be found.</h2>' ]

module.exports = NotFound
