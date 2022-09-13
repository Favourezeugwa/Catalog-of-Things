
class Genre
  attr_accessor :name, :items
  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(genre)
    @item = item
    item.genre.push(self) unless item.include?(self)
  end
end





# def classroom=(classroom)
#     @classroom = classroom
#     classroom.student.push(self) unless classroom.include?(self)
#   end