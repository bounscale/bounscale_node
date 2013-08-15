BusynessCollector = require('./busyness_collector')

class ThroughputCollector extends BusynessCollector
  pre : ->

  post : ->

  name : ->
    return "throughput"

  value : ->
    if BusynessCollector.history.length < 2
      return 0
    else
      return (BusynessCollector.history.length / this.whole_sec()) * 60

module.exports = ThroughputCollector 
