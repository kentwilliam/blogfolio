config = require './config'
mongoose = require 'mongoose'

try
  mongoose.connect config.mongoHost, 'test', config.mongoPort
catch e
  console.log "Failed to connect to MongoDB database"
  process.exit 1

module.exports = mongoose
