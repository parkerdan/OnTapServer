class Bar < ActiveRecord::Base
  belongs_to :user
  has_many :taps, dependent: :destroy


  def self.get_bars
    reply = []
    Bar.order(:title).each do |b|
      # dev settings for non-filtered
      # tap_count = Tap.where("bar_id = ?", b.id).count
      #
      #   reply << { :title => b.title,:id => b.id, :cardCount => tap_count }
      #


      tap_count = Tap.where("bar_id = ? AND show_card = ?", b.id,true).count
      if tap_count > 0
        reply << { :title => b.title,:id => b.id, :cardCount => tap_count }
      end

      
    end
    return reply
  end



end
