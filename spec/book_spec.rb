require_relative '../classes/book'

describe Book do
  before :each do
    @book = Book.new('Common sense approach to programming', 'Micheal Hart')
  end

  it 'returns a new book object' do
    expect(@book).to be_instance_of(Book)
  end

  it 'accepts 2 parameters' do
    expect(@book.title).to eq('Common sense approach to programming')
    expect(@book.author).to eq('Micheal Hart')
  end

  it 'does not accept less than 2 parameters' do
    expect { Book.new('Common sense approach to programming') }.to raise_error(ArgumentError)
  end

  it 'does not accept more than 2 parameters' do
    expect { Book.new('Going home', 'Fisher adams', 'published in 2012') }.to raise_error(ArgumentError)
  end

  it 'does not have any rentals' do
    expect(@book.rentals.length).to eq(0)
    expect(@book.rentals).to eq([])
  end
end
