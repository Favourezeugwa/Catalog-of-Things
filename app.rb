require_relative 'classes/item'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/music_album'
require_relative 'modules/book_module'
require_relative 'modules/label_module'
require_relative 'modules/music_album_module'
require_relative 'classes/game'
require_relative 'classes/author'
require_relative 'modules/book_module'
require_relative 'modules/label_module'
require_relative 'modules/validity'
require_relative 'modules/handle_files'

require 'json'
class App
  include BookModule
  include LabelModule
  include MusicAlbumModule
  include Validity
  include HandleFiles

  def initialize
    @response = 0
    @books = []
    @labels = []
    @music_albums = []
    @games = []
    @authors = []


    load_albums
    load_books
    load_labels
    load_author
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
