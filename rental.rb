class Rental
  attr_reader :book, :person

  def initialize(book, person)
    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end
end
