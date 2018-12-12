require_relative '../factory_method/minimal/factory_method'
require_relative '../factory_method/metaphor/factory_method'

describe 'Factory Method' do
  context 'Minimal' do
    it 'builded class is a ConcreteElementOne' do
      args = {'type' => :one, 'content' => 'present'}

      factory = FactoryElementsMethod.build(args)

      expect(factory.class).to eq ConcreteElementOne
    end
    it 'builded class is a ConcreteElementTwo' do
      args = {'type' => :two, 'content' => 'present'}

      concrete_element = FactoryElementsMethod.build(args)

      expect(concrete_element.class).to eq ConcreteElementTwo
    end
    it 'do concrete action for ConcreteElementOne' do
      args = {'type' => :one, 'content' => 'present'}

      concrete_element = FactoryElementsMethod.build(args)

      expect(concrete_element.do).to eq 'ConcreteElementOne present'
    end
    it 'do concrete action for ConcreteElementTwo' do
      args = {'type' => :two, 'content' => 'present'}

      concrete_element = FactoryElementsMethod.build(args)

      expect(concrete_element.do).to eq 'ConcreteElementTwo present'
    end
  end

  context 'Metaphor' do
    it 'builded class is a XmlToJson' do
      xml = '<menu><food><name>Waffles</name><price>5.95</price></food><food><name>French Toast</name><price>4.50</price></food></menu>'
      args = {'type' => :xml, 'xml' => xml}

      xml_to_json = FactoryJsonConverterMethod.build(args)

      expect(xml_to_json.class).to eq XmlToJson
    end
    it 'builded class is a CsvToJson' do
      csv = "#{File.dirname(__FILE__)}/../support/user.csv"
      args = {'type' => :csv, 'csv' => csv}

      csv_to_json = FactoryJsonConverterMethod.build(args)

      expect(csv_to_json.class).to eq CsvToJson
    end
    it 'do json from xml' do
      xml = '<menu><food><name>Waffles</name><price>5.95</price></food><food><name>French Toast</name><price>4.50</price></food></menu>'
      args = {'type' => :xml, 'xml' => xml}

      xml_to_json = FactoryJsonConverterMethod.build(args)

      expect(xml_to_json.do).to eq "{\"menu\":{\"food\":[{\"name\":\"Waffles\",\"price\":\"5.95\"},{\"name\":\"French Toast\",\"price\":\"4.50\"}]}}"

    end
    it 'do json from csv' do
      csv = '''
        demo@demo.es,Usuario Demo,Administrador
        admin@demo.es,Usuario Admin,Administrador
      '''.strip
      keys = ["email","name","main_view"]
      args = {'type' => :csv, 'csv' => csv, 'keys' => keys}

      csv_to_json = FactoryJsonConverterMethod.build(args)

      expect(csv_to_json.do).to eq "[{\"email\":\"demo@demo.es\",\"name\":\"Usuario Demo\",\"main_view\":\"Administrador\"},{\"email\":\"        admin@demo.es\",\"name\":\"Usuario Admin\",\"main_view\":\"Administrador\"}]"
    end
  end
end
