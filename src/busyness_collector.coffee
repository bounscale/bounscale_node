BaseCollector = require('./base_collector')

class BusynessCollector extends BaseCollector
  @HISTORY_HOLDING_SEC = 10
  @history = []

  @clear_history = ->
    BusynessCollector.history = []

  pre : ->
    @pre_time = new Date()

  post : ->
    @post_time = new Date()
    BusynessCollector.history.push([@pre_time, @post_time])

  name : ->
    return "busyness"

  value : ->
    if BusynessCollector.history.length < 2
      return 0
    else
      return (this.estimate_sec() / this.whole_sec()) * 100

  fix_history : ->
    new_history = BusynessCollector.history.filter (h) ->
      ((@post_time - h[1]) / 1000) > BusynessCollector.HISTORY_HOLDING_SEC
    BusynessCollector.history = new_history

  whole_sec : ->
    oldest_pre = BusynessCollector.history[0][0]
    newest_post = BusynessCollector.history[BusynessCollector.history.length - 1][1]
    return  (newest_post - oldest_pre) / 1000

  estimate_sec : ->
    result = 0.0
    for h in BusynessCollector.history
      pre_time = h[0]
      post_time = h[1]
      result += (post_time - pre_time)
    return (result / 1000)

module.exports = BusynessCollector 
