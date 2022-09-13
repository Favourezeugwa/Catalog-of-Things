require_relative '../classes/musicAlbum'

describe MusicAlbum do 

  before :each do
       @musicAlbum = MusicAlbum.new(true, '2022-03-24')
  end

context 'when testing the MusicAlbum class' do
  it 'should return true if object is an instance of the MusicAlbum class' do
    expect(@musicAlbum).to be_an_instance_of MusicAlbum
  end

  it 'should return true on having album on_spotify ' do
    on_sportify = @musicAlbum.on_sportify == true
    expect(on_sportify).to be true
  end

    it 'should return true when calling the can_be_archived? method' do
      expect(@musicAlbum.can_be_archived?).to be true
end
end
end
