require_relative 'classes/item'

class App
  def initialize
  end

  def menu_options
    puts 'WELCOME TO MY CATALOG OF THINGS!'
    response = 0
    while response != 10
      puts(
        'Please choose an option by entering a number:
        1 - List all books
        2 - List all music albums
        3 - List of games 
        4 - List all labels
        5 - List all authors
        6 - List all sources
        7 - Add a book
        8 - Add a music album
        9 - Add a game
        10 - Exit'
      )
      start_app
    end
  end

  def start_app
    response = gets.chomp
    case response
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_games
    when 4
      list_labels
    when 5
      list_authors
    when 6
      list_sources
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    end
  end
end