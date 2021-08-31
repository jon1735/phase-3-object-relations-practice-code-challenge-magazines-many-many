class Subscription < ActiveRecord::Base
  belongs_to :magazine
  belongs_to :reader

  def print_details 
    puts "#{self.reader.name} subscribed to #{magazine.title} for $#{price}"
  end

  def total_subscription_price
    subscription.sum(:price)
  end

  def cancel_subscription(magazine)
    Subscription.find_by(magazine: magazine, reader: self).destroy 
  end
  # to test this we need to assign a reader and magazine a variable.... so when we go to test,
  # we can just call the reader_variable.cancel_subscription(magazine_variable)
end
