class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    Subscription.create(
      magazine: magazine,
      reader_id: self.id,
      price: price
    )
  end
end
