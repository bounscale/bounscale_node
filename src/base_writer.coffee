class BaseWriter
  @FORMAT_VERSION = 0
  @BOUNSCALE_OPEN_UUID  = "b74e646e-7e55-448f-814d-e36eedc44ea9"
  @BOUNSCALE_CLOSE_UUID = "4a061908-db52-4224-ad4b-9850a47c7edf"

  @strip_uuid = (str) ->
    return str.replace(BaseWriter.BOUNSCALE_OPEN_UUID, "").replace(BaseWriter.BOUNSCALE_CLOSE_UUID, "")

  write : (collector_instances) ->
    result = {'format_ver' : BaseWriter.FORMAT_VERSION, 'datetime' : (new Date()).toString(), 'data' : []}
    result['framework_ver'] = "node.js #{global?.process?.version}"
    for collector in collector_instances
      result['data'].push({'name' : collector.name(), 'value' : collector.value()})
    str = "#{BaseWriter.BOUNSCALE_OPEN_UUID}#{JSON.stringify(result)}#{BaseWriter.BOUNSCALE_CLOSE_UUID}"
    this.output(str)
    return str

  output : (str) ->
    
module.exports = BaseWriter
