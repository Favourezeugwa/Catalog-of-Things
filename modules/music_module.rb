require_relative '../classes/genre'

module MusicModule
  def create_music
    puts 'Is the music album on spotify? [y/n]: '
    on_sportify = gets.chomp
    case on_sportify
    when 'y'
      on_sportify = true
    when 'n'
      on_sportify = false
    end

    puts 'Enter the published date (YYYY-MM-DD): '
    publish_date = gets.chomp

    MusicAlbum.new(on_sportify, publish_date)
  end

  def add_new_genre
    puts 'Enter genre name: '
    name = gets.chomp

    Genre.new(name)
  end

  def add_existing_genre
    list_genres

    puts 'Select ID of genre: '
    genre_id = gets.chomp.to_i
    @genres.find { |genre| genre.id == genre_id }
  end

  def add_music_album
    music = create_music
    puts 'To create a new genre enter [1] or to an existing genre enter [2]'
    genre = gets.chomp.to_i
    case genre
    when 1
      genre = add_new_genre
      @genres << genre.add_item(music)
      @music_albums << music
      save_genre
    when 2
      genre = add_existing_genre
      genre.add_item(music)
      @music_albums << music
      save_genre
    end
  end

  def list_music_albums
    puts
    @genres.each_with_index do |genre, index|
      genre.items.each do |item|
        puts "#{index}) Name: '#{genre.name}', On spotify: '#{item.on_sportify}', Published date: '#{item.publish_date}'"
      end
    end
  end

  def list_genres
    puts 'No genres found' if @genres.empty?
    @genres.each_with_index do |genre, index|
      puts "#{index}) Genre\'s name: '#{genre.name}', [Genre ID]: '#{genre.id}'"
    end
  end
end
