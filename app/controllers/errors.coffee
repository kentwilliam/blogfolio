module.exports =
  default: (err, req, res, next) ->
    stack = (new Error()).stack
    if stack.join
      stack = stack.join('\n')
    res.send '<pre>' + err + '\n' + stack + '</pre>'
