class Tap < ActiveRecord::Base
  belongs_to :bar
  belongs_to :user


  def self.get_cards(bar_id)
    reply = []
    bar = Bar.find_by_id(bar_id)
    bar.increment!(:requests)
    taps = Tap.where("bar_id = ? AND show_card = ?", bar_id, true)

    taps.each do |t|
      recipe = (t.show_recipe) ? t.recipe : false
      reply << { :title => t.title,:id => t.id, :description => t.description, :imageId => t.image_id, :backgroundColor => t.color, :textColor => t.text_color, :hoppiness => t.hoppiness, :barId => t.bar_id, :recipe => recipe }
    end
    return reply
  end


end
