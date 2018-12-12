require 'crack'
require 'crack/xml'
require 'csv'
require 'json'

class JsonConverter
  def do
    raise 'You must implement this method'
  end
end

class FactoryJsonConverterMethod
  class << self
    def build(args)
      if args['type'] == :xml
        XmlToJson.new(args['xml'])
      elsif args['type'] == :csv
        CsvToJson.new(args['csv'], args['keys'])
      end
    end
  end
end

class XmlToJson < JsonConverter
  def initialize(xml)
    @xml = xml
  end

  def do
    Crack::XML.parse(@xml).to_json
  end
end

class CsvToJson < JsonConverter
  def initialize(csv, keys)
    @csv = csv
    @keys = keys
  end

  def do
    parsed = CSV.parse(@csv).map {|a| Hash[@keys.zip(a)] }
    parsed.to_json
  end
end
