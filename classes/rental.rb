class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @book = book
    @person = person
    @date = date
  end
end
