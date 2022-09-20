require_relative 'helper_methods'
require_relative '../modules/book_module'

module HandleLabel
  include HelperFunctions
  include BookModule

  # BOOKS
  def save_label
    array = []
    @labels.each do |label|
      array << {
        label_id: label.id,
        title: label.title,
        color: label.color,
        Items: label.items.map do |item|
                 {
                   cover_state: item.cover_state,
                   publisher: item.publisher,
                   publish_date: item.publish_date
                 }
               end
      }
    end
    write_json(array, './JSONdata/labels.json')
  end

  def load_labels
    parse_file = read_json('./JSONdata/labels.json')
    parse_file.each do |label|
      tag = Label.new(label['title'], label['color'])
      @labels << tag
      label['Items'].each do |item|
        tag.add_item(Book.new(item['cover_state'], item['publisher'], item['publish_date']))
      end
    end
  end
end
