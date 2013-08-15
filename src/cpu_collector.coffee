BaseCollector = require('./base_collector')
os = require('os')

class CpuCollector extends BaseCollector
  pre : ->
    @pre_user_time = os?.cpus()?[0]?.times?.user
    @pre_system_time = os?.cpus()?[0]?.times?.sys

  post : ->
    @post_user_time = os?.cpus()?[0]?.times?.user
    @post_system_time = os?.cpus()?[0]?.times?.sys
    @elapsed_user_time =  @post_user_time - @pre_user_time
    @elapsed_system_time = @post_system_time - @pre_system_time

  name : ->
    return "cpu"

  value : ->
    return (@elapsed_user_time + @elapsed_system_time)

module.exports = CpuCollector
