class Item
    attr_accessor  :publish_date
    def initialize(publish_date)
        @id = Random.rand(1..1000)
        @publish_date = publish_date
        @archived= false
    end
    def test_time
        puts  Time.now.year -(@publish_date).year
    end
    def can_be_archived?
        Time.now.year -(@publish_date).year > 10

    end
    def move_to_archive
       if can_be_archived?
        @archived=true
        end
    end
end

new_item = Item.new((2001-2-25))
new_item.test_time