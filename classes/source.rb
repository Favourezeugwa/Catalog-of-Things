require_relative 'movie'

class Source
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

source1 = Source.new('Favour')
# p source1

movie1 = Movie.new('2022-09-10', true)
movie2 = Movie.new('2019-08-18', false)
# p movie1

p source1.add_item(movie1)
p source1.add_item(movie2)