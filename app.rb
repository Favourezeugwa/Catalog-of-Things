require_relative 'classes/item'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/game'
require_relative 'classes/author'
require_relative 'classes/music'
require_relative 'classes/genre'
require_relative 'modules/validity'
require_relative 'handler/handle_files'

require 'json'
class App
  include Validity
  include HandleFiles

  def initialize
    @response = 0
    @books = []
    @games = []
    @music_albums = []
    @authors = []
    @labels = []
    @genres = []

    load_labels
    load_author
    load_genres
  end

  def menu_options
    puts 'WELCOME TO MY CATALOG OF THINGS!'
    while @response != 10
      puts(
        'Please choose an option by entering a number:
        1 - List all books
        2 - List all music albums
        3 - List of games
        4 - List all labels
        5 - List all genres
        6 - List all authors
        7 - Add a book
        8 - Add a music album
        9 - Add a game
        10 - Exit'
      )
      start_app
    end
  end

  def start_app
    @response = gets.chomp.to_i
    case @response
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_games
    when 4
      list_labels
    when 5
      list_genres
    when 6
      list_authors
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    end
  end
end
