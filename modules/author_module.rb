module AuthorModule
  def add_author
    puts 'Author\'s First name: '
    first_name = gets.chomp
    valid_name(first_name)

    puts 'Author\'s Last name: '
    last_name = gets.chomp
    valid_last_name(last_name)

    author = Author.new(first_name, last_name)
    @authors.push(author)
    puts 'Author added Successfully!'
    save_author
  end

  def list_authors
    puts
    @authors.each_with_index do |author, index|
      puts "#{index}) [Author ID]: '#{author.id}', First name: '#{author.first_name}', Last name: '#{author.last_name}'"
    end
  end
end
