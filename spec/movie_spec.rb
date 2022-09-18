require_relative 'spec_helper'

describe Movie do
  let(:movie1) { Movie.new('2022-09-10', true) }

  describe '#movie class' do
    it 'takes an instance of the Movie class' do
      expect(movie1).to be_an_instance_of(Movie)
    end
  end

  describe '#arguements' do
    it 'returns the arguements passed in' do
      expect(movie1.publish_date).to eql('2022-09-10')
      expect(movie1.silet).to eql(true)
    end
  end

  describe '#can_be_archived method' do
    it 'returns true if silet is true' do
      expect(movie1.can_be_archived?).to eql(true)
      expect(movie1.can_be_archived?).to_not eql(false)
    end
  end
end
