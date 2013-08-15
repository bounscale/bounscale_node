BusynessCollector = require('./busyness_collector')
ThroughputCollector = require('./throughput_collector')
CpuCollector = require('./cpu_collector')
MemoryCollector = require('./memory_collector')

HerokuWriter = require('./heroku_writer')

module.exports = (req, res, next) ->
  collector_instances = [new BusynessCollector(), new ThroughputCollector(), new CpuCollector(), new MemoryCollector()]
  for collector in collector_instances
    collector.pre()
  next()
  for collector in collector_instances
    collector.post()
  writer = new HerokuWriter()
  writer.write(collector_instances)
