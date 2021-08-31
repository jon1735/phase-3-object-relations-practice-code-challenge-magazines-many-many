class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    emails = readers.pluck(:email) # first get an array of the emails of this magazines readers
    emails.join(";") # join the array with a ;
    # to test we need an instance of magazine.... so we can do "mag = Magazine.first"
    # then do mag.email_list
    # then finally do mag.readers
  end

  def self.most_popular
    # iterate through all magazines and get the max amount of subscribers
    highest_subscriber_count = Magazine.all.map do |magazine|
      magazine.subscriptions.count
    end.max

    all.find do |magazine|
      magazine.subscription.count ==  highest_subscriber_count
  # find which magazine had the most subscribers and return that
    end
  end
end
