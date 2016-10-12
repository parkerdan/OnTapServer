class Tap < ActiveRecord::Base
  belongs_to :bar
  belongs_to :user


  def self.get_cards(bar_id)
    reply = []
    taps = Tap.where(bar_id: bar_id)

    taps.each do |t|
      reply << { :title => t.title,:id => t.id, :description => t.description, :imageId => t.image_id, :backgroundColor => t.color, :textColor => t.text_color, :hoppiness => t.hoppiness, :barId => t.bar_id }
    end
    return reply
  end


end
