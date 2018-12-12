class ConcreteElement
  def do
    raise 'You must implement this method'
  end
end

class FactoryElementsMethod
  class << self
    def build(args)
      if args['type'] == :one
        ConcreteElementOne.new(args['content'])
      elsif args['type'] == :two
        ConcreteElementTwo.new(args['content'])
      end
    end
  end
end

class ConcreteElementOne < ConcreteElement
  def initialize(content)
    @content = content
  end

  def do
    return "ConcreteElementOne #{@content}"
  end
end

class ConcreteElementTwo < ConcreteElement
  def initialize(content)
    @content = content
  end

  def do
    return "ConcreteElementTwo #{@content}"
  end
end
