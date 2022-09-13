require_relative '../classes/label'
describe Label do
  before :each do
    @label = Label.new 'Label', 'Red'
  end

  context 'when testing the Book class' do
    it 'should return true if object is an instance of the Label class' do
      expect(@label).to be_an_instance_of Label
    end

    
  end
end
