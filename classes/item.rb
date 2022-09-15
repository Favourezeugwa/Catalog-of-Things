require 'date'

class Item
  attr_accessor :genre, :author, :source, :label
  attr_reader :publish_date, :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    Date.today - Date.parse(@publish_date) > 3650
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end
end
