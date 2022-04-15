require_relative 'rental'

class RentalModule
  attr_accessor :books, :people, :rentals, :file_location

  def initialize(books, persons)
    @file_location = 'storage/rentals.json'
    @books = books
    @people = persons
    file = File.open(@file_location, 'a+')
    @rentals = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
  end

  def create_rental
    file = File.open(@file_location, 'w')
    if @books.empty? == true || @people.empty? == true
      puts 'Sorry no book or people registered to create rental for'
      return
    end

    puts 'Select a book from the following list by number'

    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book['title']}\", Author: #{book['author']}" }

    book_index = gets.chomp.to_i
    book_obj = @books[book_index]

    puts 'Select a person from the following list by number'

    @people.each_with_index do |person, index|
      puts "#{index}) [#{person['json_class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person_index = gets.chomp.to_i
    person_obj = @people[person_index]

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, book_obj, person_obj)
    rental = rental.to_json
    @rentals << rental
    file.write(JSON[@rentals])
    file.close
    puts "New rental created for #{person_obj['name']}"
  end

  def list_rentals
    puts 'Sorry no people available at the moment' if @people.empty?

    print 'ID of the person: '

    person_id = gets.chomp.to_i

    puts 'Rentals: '
    @rentals.each do |rental|
      if rental['person']['id'] == person_id
        puts "Date: #{rental['date']} Book: \"#{rental['book']['title']}\" by #{rental['book']['author']}"
      end
    end
  end
end
