class ObserversInterface
  def send
    raise 'You must implement this method'
  end
end

class SubjectObservable
  def initialize
    @finish = false
    @observers = []
  end

  def add(observer)
    @observers << observer
  end

  def notify
    @observers.each do |observer|
      observer.update()
    end
  end

  def finish
    @finish = true
    notify
  end

  def state
    @finish
  end
end

class OneObserver < ObserversInterface
  def initialize(observable)
    @subject = observable
    @state = "I am waiting"
  end
  def update
    @state = 'Thanks for finish' if @subject.state
  end
  def state
    @state
  end
end

class TwoObserver < ObserversInterface
  def initialize(observable)
    @subject = observable
    @state = "I am waiting"
  end
  def update
    @state = "Ohh, no. Don't stop it" if @subject.state
  end
  def state
    @state
  end
end
