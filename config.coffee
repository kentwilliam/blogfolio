_ = require 'lodash'

env = process.env.NODE_ENV or 'development'

config =
  default:
    mongoHost: process.env.MONGO_NODE_DRIVER_HOST || 'localhost'
    mongoPort: process.env.MONGO_NODE_DRIVER_PORT || 27017
    httpPort:  process.env.HTTP_PORT || 4000

module.exports = _.extend(config.default, config[env] or {})
