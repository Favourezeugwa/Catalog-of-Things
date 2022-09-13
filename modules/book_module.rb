

module BookModule


  def list_books
    puts 'No books found' if @books.empty?
    @books.each do |book|
      puts "Publisher: #{book.publisher}, Publish date: #{book.publish_date}"
    end
  end

  def add_book
    puts 'Enter publisher:'
    publisher = gets.chomp
    puts 'Enter cover state:'
    cover_state = gets.chomp
    puts 'Enter publish date:'
    publish_date = gets.chomp
    puts 'Enter label title:'
    label_title = gets.chomp
    puts 'Enter label color:'
    label_color = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    label= Label.new(label_title, label_color)
    label.add_item(book)
    @labels << label
    @books << book
    puts 'Book added successfully'
    save_books
    save_labels
   
  end

  def save_books
    book_hash = []
    @books.each do |book|
      book_hash << {
        publisher: book.publisher,
        cover_state: book.cover_state,
        publish_date: book.publish_date
      }
    end
    File.open('./JSONdata/books.json', 'w') { |f| f.puts book_hash.to_json }
  end

  def load_books
    book_file = File.exist?('./JSONdata/books.json') ? File.read('./JSONdata/books.json') : '[]'
    book_h = JSON.parse(book_file)
    book_h.each do |book|
      book_new = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
      @books << book_new
    end
  end
end
