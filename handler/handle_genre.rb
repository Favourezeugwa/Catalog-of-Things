require_relative 'helper_methods'
require_relative '../modules/music_module'

module HandleGenre
  include HelperFunctions
  include MusicModule

  # MUSIC
  def save_genre
    array = []
    @genres.each do |genre|
      array << {
        genre_id: genre.id,
        name: genre.name,
        Items: genre.items.map do |item|
                 {
                   on_sportify: item.on_sportify,
                   publish_date: item.publish_date
                 }
               end
      }
    end
    write_json(array, './JSONdata/genres.json')
  end

  def load_genres
    parse_file = read_json('./JSONdata/genres.json')
    parse_file.each do |genre|
      record = Genre.new(genre['name'])
      @genres << record
      genre['Items'].each do |item|
        record.add_item(MusicAlbum.new(item['on_sportify'], item['publish_date']))
      end
    end
  end
end