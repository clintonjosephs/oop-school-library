require_relative 'modules/person_module'
require_relative 'modules/rental_module'

class App
  attr_accessor :rentals, :books, :people

  def initialize
    @people = []
    @rentals = []
    @books = []
    @rentals = RentalModule.new({ rentals: @rentals, people: @people, books: @books })
    @people = PersonModule.new(@people)
    @books = BookModule.new(@books)
  end

  def menu_display
    puts ' '
    puts 'Please choose an option by entering a number:
            1 - List all books
            2 - List all people
            3 - Create a person
            4 - Create a book
            5 - Create a rental
            6 - List all rentals for a given person id
            7 - Exit'
  end

  def menu_selection
    menu_display
    selection = gets.chomp.to_i
    case selection
    when 1
      @books.list_all_books
    when 2
      @people.list_all_people
    when 3
      @people.create_person
    when 4
      @books.create_book
    when 5
      @rentals.create_rental
    when 6
      @rentals.list_rentals
    when 7
      puts 'Thank you for using this app 😀😉😊'
      exit
    else
      puts 'Invalid selection'
    end
    menu_selection
  end
end

