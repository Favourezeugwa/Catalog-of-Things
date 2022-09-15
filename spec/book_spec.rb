require_relative '../classes/book'
describe Book do
  before :each do
    @book = Book.new 'Publisher', 'Good', '2022-01-01'
  end

  context 'when testing the Book class' do
    it 'should return true if object is an instance of the Book class' do
      expect(@book).to be_an_instance_of Book
    end

    it 'should return false when acquiring the cover_state property' do
      cover_state = @book.cover_state == 'Bad'
      expect(cover_state).to be false
    end

    it 'should return false when calling the can_be_archived? method' do
      expect(@book.can_be_archived?).to be false
    end
  end
end
