require_relative 'spec_helper'

describe Source do
  let(:source1) { Source.new('Game of Thrones') }
  let(:movie1) { Movie.new('1998-09-18', false) }
  let(:movie2) { Movie.new('2002-12-31', true) }

  describe '#source object' do
    it 'returns an instance of the Source class' do
      expect(source1).to be_an_instance_of(Source)
      expect(source1).to be_a(Source)
    end

    it 'returns the name' do
      expect(source1.name).to eql('Game of Thrones')
    end

    it 'returns an item array' do
      expect(source1.items).to be_an(Array)
    end
  end

  describe '#add_item method' do
    it 'it returns items pushed into the items array' do
      source1.add_item(movie1)
      expect(source1.items).to include(movie1)
    end

    it 'should add self as a property of the item object' do
      source1.add_item(movie1)
      source1.add_item(movie2)
      expect(movie1.source).to eql(source1)
      expect(movie2.source).to eql(source1)
    end

    it 'returns 2 sized array of items' do
      source1.add_item(movie1)
      source1.add_item(movie2)
      expect(source1.items.size).to eql(2)
      expect(source1.items.size).to_not eql(1)
    end
  end
end
