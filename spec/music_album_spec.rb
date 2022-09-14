require_relative '../classes/music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('Gids_album' ,true, '2022-03-24')
  end

  context 'when testing the MusicAlbum class' do
    it 'should return true if object is an instance of the MusicAlbum class' do
      expect(@music_album).to be_an_instance_of MusicAlbum
    end

    it 'should return true on having album on_spotify ' do
      on_spotify = @music_album.on_spotify == true
      expect(on_spotify).to be true
    end

    it 'should return true when calling the can_be_archived? method' do
      expect(@music_album.can_be_archived?).to be true
    end
  end
end
