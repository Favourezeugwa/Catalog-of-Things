module HandleFiles
  # WRITER
  def write_json(array, file_path)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write(file_path, JSON.generate(array, opts))
  end

  # READER
  def read_json(file_path)
    return unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end

  def save_games
    array = []
    @games.each do |game|
      array << {
        publish_date: game.publish_date,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at
      }
    end
    write_json(array, './JSONdata/games.json')
  end

  def load_games
    parse_file = read_json('./JSONdata/games.json')
    return if parse_file.nil?

    parse_file.each do |game|
      @games << Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
    end
  end

  def save_author
    array = []
    @authors.each do |author|
      array << {
        author_id: author.id,
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    write_json(array, './JSONdata/authors.json')
  end

  def load_author
    parse_file = read_json('./JSONdata/authors.json')
    parse_file.each do |author|
      @authors << Author.new(author['first_name'], author['last_name'])
    end
  end
end
