require_relative 'music'

class Genre
  attr_accessor :name, :items, :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(music)
    @items.push(music)
    music.genre = self
  end
end
