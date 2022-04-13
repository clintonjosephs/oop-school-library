require_relative '../classes/rental'
require_relative '../classes/book'
describe Rental do
  before :each do
    @book = Book.new('Common sense approach to programming', 'Micheal Hart')

    @teacher = Teacher.new('math', 19, 'sam')
    @rental = Rental.new('2020-12-11', @book, @teacher)
  end

  it 'it should return parameters' do
    expect(@rental.date).to eq('2020-12-11')
    expect(@rental.book.title).to eq('Common sense approach to programming')
    expect(@rental.person.name).to eql('sam')
  end

  it 'it should return instance' do
    expect(@rental).to be_instance_of Rental
  end
end
