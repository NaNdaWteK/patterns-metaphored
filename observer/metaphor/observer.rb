class EmailSender
  def send
    raise 'You must implement this method'
  end
end

class WebsiteBlog
  def initialize
    @observers = []
  end

  def add(observer)
    @observers << observer
  end

  def notify
    @observers.each do |observer|
      observer.send()
    end
  end

  def create_post
    notify
  end
end

class SubscribersObserver < EmailSender
  def initialize(blog)
    @blog = blog
    @emails_sended = false
  end
  def send
    @emails_sended = true if "Send an email to subscribers".is_a?(String)
  end
  def emails_send?
    @emails_sended
  end
end

class FriendsObserver < EmailSender
  def initialize(blog)
    @blog = blog
    @emails_sended = false
  end
  def send
    @emails_sended = true if "Send an email to friends".is_a?(String)
  end
  def emails_send?
    @emails_sended
  end
end
