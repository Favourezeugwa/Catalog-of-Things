require_relative 'helper_methods'
require_relative '../modules/movie_module'

module HandleSource
  include HelperFunctions
  include MovieModule

  # MOVIES
  def save_sources
    array = []
    @sources.each do |source|
      array << {
        source_id: source.id,
        source_name: source.name,
        Items: source.items.map do |item|
                 {
                   publish_date: item.publish_date,
                   silet: item.silet
                 }
               end
      }
    end
    write_json(array, './JSONdata/sources.json')
  end

  def load_sources
    parse_file = read_json('./JSONdata/sources.json')
    parse_file.each do |source|
      list = Source.new(source['source_name'])
      @sources << list
      source['Items'].each do |item|
        list.add_item(Movie.new(item['publish_date'], item['silet']))
      end
    end
  end
end
