module MusicAlbumModule
    def list_music_albums
    puts 'No Music Album found' if @music_albums.empty?
    @music_albums.each do |album|
      puts "Name: #{album.name}, On_Spotify: #{album.on_spotify}"
    end
  end 

  def add_music_album
    puts 'Enter name:'
    name = gets.chomp
    puts 'Music Album on spotify?(true/false)'
   on_spotify = gets.chomp
     puts 'Enter the publish date:'
    publish_date = gets.chomp
    album = MusicAlbum.new(name, on_spotify, publish_date)
    @music_albums << album
    puts 'Music Album added successfully'
    save_albums
  end

    def save_albums
    album_hash = []
    @music_albums.each do | album |
     album_hash << {
        name: album.name,
        on_spotify: album.on_
        publish_date: album.publish_date
      }
      
    end
    File.open('./JSONdata/albums.json', 'w') { |f| f.puts album_hash.to_json }
  end

def load_albums
    album_file = File.exist?('./JSONdata/albums.json') ? File.read('./JSONdata/albums.json') : '[]'
    album_h = JSON.parse(album_file)
    album_h.each do |album|
     album_new = MusicAlbum.new(album['name'], album['on_spotify'], album['publish_date'])
      @music_albums << album_new
    end
  end
end 