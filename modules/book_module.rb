require_relative '../classes/label'

module BookModule
  def create_book
    puts 'Enter publisher:'
    publisher = gets.chomp

    puts 'Enter cover state:'
    cover_state = gets.chomp

    puts 'Enter publish date:'
    publish_date = gets.chomp

    Book.new(publisher, cover_state, publish_date)
  end

  def new_book_label
    puts 'Enter label title:'
    title = gets.chomp

    puts 'Enter label color:'
    color = gets.chomp

    Label.new(title, color)
  end

  def existing_book_label
    list_labels
    puts 'Select a book ID from the list: '
    label_id = gets.chomp
    label_id = label_id.to_i
    @labels.find { |label| label.id == label_id }
  end

  def add_book
    book = create_book
    puts 'To create a new label [1] or existing label [2]: '
    label = gets.chomp.to_i
    case label
    when 1
      label = new_book_label
      @labels << label.add_item(book)
      @books << book
      save_label
    when 2
      label = existing_book_label
      label.add_item(book)
      @books << book
      save_label
    end
  end

  def list_books
    puts 'No books found' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index}) Publisher: #{book.publisher}, Publish date: #{book.publish_date}"
    end
  end

  def list_labels
    puts 'No labels found' if @labels.empty?
    @labels.each_with_index do |label, index|
      puts "#{index}) [label ID]: '#{label.id}', Label title: '#{label.title}', Label color: '#{label.color}'"
    end
  end
end