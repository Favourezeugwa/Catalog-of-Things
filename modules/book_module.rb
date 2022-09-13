module BookModule
  def list_books
    puts 'No books found' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.publisher}, Author: #{book.publish_date}"
    end
  end

  def add_book
    puts 'Enter publisher:'
    publisher = gets.chomp
    puts 'Enter cover state:'
    cover_state = gets.chomp
    puts 'Enter publish date:'
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
    puts 'Book added successfully'
  end
end
