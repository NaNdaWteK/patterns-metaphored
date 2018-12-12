require_relative '../factory_method/minimal/factory_method'

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
end
