_ = require 'lodash'

class UiComponent
  constructor: (scope) ->
    @scope = scope

  components: -> []

  header: ->
    '<!DOCTYPE html><html><head><title>Test</title></head><body>'

  footer: ->
    '</body></html>'

  page: (callback) ->
    callback null, @header() + @render() + @footer()

  render: (callback) ->
    _.map(@components(), (component) ->
      if component and typeof component.render == 'function'
        component.render()
      else
        component
    ).join('')

module.exports = UiComponent
