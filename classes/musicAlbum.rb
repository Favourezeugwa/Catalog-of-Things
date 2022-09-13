require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_sportify, :publish_date

  def initialize(on_sportify, publish_date)
    super(publish_date)
@on_sportify = on_sportify
  end

  def can_be_archived?()
    super || @on_sportify == true
  end
end