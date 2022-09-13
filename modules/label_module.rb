module LabelModule
  def list_labels
    puts 'No labels found' if @labels.empty?
    @labels.each do |label|
      puts "Label title: #{label.title}, Label color: #{label.color}"
    end
  end
  def save_labels
   label_hash = []
    @labels.each do |label|
      label_hash << {
        title: label.title,
        color: label.color
      }
    end
    File.open('./JSONdata/labels.json', 'w') { |f| f.puts label_hash.to_json }
  end

  def load_labels
    label_file = File.exist?('./JSONdata/labels.json') ? File.read('./JSONdata/labels.json') : '[]'
    label_h = JSON.parse(label_file)
    label_h.each do |label|
      label_new = Label.new(label['title'], label['color'])
      @labels << label_new
    end
  end
   
end