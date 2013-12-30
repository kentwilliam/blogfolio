module.exports = (req, res, next) ->
  res.status(404).render 'not_found', {}, (err, str) ->
    return next() if err
    res.send str
