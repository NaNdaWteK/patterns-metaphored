require_relative '../observer/minimal/observer'
require_relative '../observer/metaphor/observer'

describe 'Observer' do
  context 'Minimal' do
    it 'OneObserver notify its sense when subject finish' do
      subject = SubjectObservable.new

      one_observer = OneObserver.new(subject)
      subject.add(one_observer)
      subject.finish

      expect(one_observer.state).to eq 'Thanks for finish'
    end

    it 'TwoObserver notify its sense when subject finish' do
      subject = SubjectObservable.new

      two_observer = TwoObserver.new(subject)
      subject.add(two_observer)
      subject.finish

      expect(two_observer.state).to eq "Ohh, no. Don't stop it"
    end
  end

  context 'Metaphor' do
  end
end
