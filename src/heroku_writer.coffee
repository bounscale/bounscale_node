BaseWriter = require('./base_writer')

class HerokuWriter extends BaseWriter
  output : (str) ->
    console.log(str)

module.exports = HerokuWriter
