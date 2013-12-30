config = require './config'
mongoose = require 'mongoose'
mongoose.connect(config.mongoHost, 'test', config.mongoPort)
module.exports = mongoose
