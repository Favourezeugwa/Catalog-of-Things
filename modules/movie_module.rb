require_relative '../classes/author'

module MovieModule
  def create_movie
    puts 'Enter movie published date (YYYY-MM-DD): '
    publish_date = gets.chomp

    puts 'Is it a silet film with no synchronized recorded sound? (y/n)'
    silet = gets.chomp
    case silet
    when 'y'
      silet = true
    when 'n'
      silet = false
    end

    Movie.new(publish_date, silet)
  end

  def new_movie_source
    puts 'Enter source name: '
    name = gets.chomp

    Source.new(name)
  end

  def existing_movie_source
    list_sources

    puts 'Select source by [source ID]: '
    source_id = gets.chomp.to_i
    @sources.find { |source| source.id == source_id }
  end

  def add_movie
    movie = create_movie

    puts 'Enter [1] to create a new source and [2] for an existing source'
    source = gets.chomp.to_i
    case source
    when 1
      source = new_movie_source
      @sources << source.add_item(movie)
      @movies << movie
      save_sources
    when 2
      source = existing_movie_source
      source.add_item(movie)
      @movies << movie
      save_sources
    end
  end

  def list_movies
    puts 'no movies found' if @sources.empty?
    @sources.each do |source|
      source.items.each_with_index do |item, index|
        puts "#{index}) [Source name]: '#{source.name}', Publish date: '#{item.publish_date}', Silet: '#{item.silet}'"
      end
    end
  end

  def list_sources
    puts 'no sources found' if @sources.empty?
    @sources.each_with_index do |source, index|
      puts "#{index}) [Source ID]: '#{source.id}', Source name: '#{source.name}'"
    end
  end
end
