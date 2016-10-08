class Tap < ActiveRecord::Base
  belongs_to :bar
  belongs_to :user

  before_create do
    taps = Tap.where(bar_id: self.bar_id)
    self.tapNumber = taps.length + 1
  end
end
