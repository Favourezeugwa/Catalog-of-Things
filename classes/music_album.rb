require_relative 'item'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify, :genre

  def initialize(name, on_spotify, publish_date)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  def can_be_archived?()
    super || @on_spotify == true
  end
end
