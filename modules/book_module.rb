module BookModule
    
    def list_books
        puts "No books found" if @books.empty?
        @books.each do |book|
            puts "Title: #{book.title}, Author: #{book.author}"
        end
    

    end
    def add_book
    end
    
end