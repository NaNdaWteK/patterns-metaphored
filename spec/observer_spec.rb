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
    it 'subscribers are notified when send a post' do
      subject = WebsiteBlog.new

      subscribers = SubscribersObserver.new(subject)
      subject.add(subscribers)
      subject.create_post

      expect(subscribers.emails_send?).to be true
    end

    it 'friends are notified when send a post' do
      subject = WebsiteBlog.new

      friends = SubscribersObserver.new(subject)
      subject.add(friends)
      subject.create_post

      expect(friends.emails_send?).to be true
    end
  end
end
