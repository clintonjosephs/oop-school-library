require './app'

state = { books: [], people: [] }
puts 'Welcome to School Library App'

def menu_display
  'Please choose an option by entering a number:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit'
end

def main(data)
  puts ' '

  puts menu_display

  user_input = gets.chomp
  app = App.new

  case user_input
  when '1'
    app.list_all_books(data[:books])
  when '2'
    app.list_all_people(data[:people])
  when '3'
    app.create_person(data[:people])
  when '4'
    app.create_book(data[:books])
  when '5'
    app.create_rental(data)
  when '6'
    app.list_rentals(data[:people])
  when '7'
    puts ''
    puts 'Thank you for using this app!'
    return
  else
    puts 'Invalid selection'
  end
  main(data)
end

main(state)
