BaseCollector = require('./base_collector')
os = require('os')

class MemoryCollector extends BaseCollector
  pre : ->

  post : ->
    @post_memory = ((os?.totalmem() - os?.freemem()) / 1024 / 1024)

  name : ->
    return "memory"

  value : ->
    return @post_memory

module.exports = MemoryCollector
