class Bar < ActiveRecord::Base
  belongs_to :user
  has_many :taps, dependent: :destroy


  def self.get_bars
    reply = []
    Bar.all.each do |b|
      reply << { :title => b.title,:id => b.id, :cardCount => Tap.where(bar_id: b.id).count }
    end
    return reply
  end



end
