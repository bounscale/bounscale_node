BaseCollector = require('./base_collector')

class MemoryCollector extends BaseCollector
  pre : ->

  post : ->
    @post_memory =  (process.memoryUsage().rss / 1024 / 1024)

  name : ->
    return "memory"

  value : ->
    return @post_memory

module.exports = MemoryCollector
