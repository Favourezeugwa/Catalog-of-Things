require_relative 'book'

class Label
  attr_accessor :title, :color, :items, :id

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

   def add_item(book)
    # @items << book unless @items.include?(book)
    # book.add_label(self)
    @items.push(book)
    book.label = self
   end
end
