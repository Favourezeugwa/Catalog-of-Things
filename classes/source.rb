require_relative 'movie'

class Source
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(movie)
    @items.push(movie)
    movie.source = self
  end
end
