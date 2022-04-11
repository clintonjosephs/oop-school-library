require './rental'

class RentalModule
  attr_accessor :books, :people, :rentals

  def initialize(params)
    @books = params[:books]
    @people = params[:people]
    @rentals = params[:rentals]
  end

  def create_rental
    if @books.empty? == true || @people.empty? == true
      puts 'Sorry no book or people registered to create rental for'
      return
    end

    puts 'Select a book from the following list by number'

    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }

    book_index = gets.chomp.to_i
    book_obj = @books[book_index]

    puts 'Select a person from the following list by number'

    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    person_obj = @people[person_index]

    print 'Date: '
    date = gets.chomp

    person_obj.add_rental(book_obj, date)
    puts "New rental created for #{person_obj.name}"
  end

  def list_rentals
    puts 'Sorry no people available at the moment' if @people.empty?

    print 'ID of the person: '

    person_id = gets.chomp.to_i
    person_fetch = @people.select { |person| person.id == person_id }

    puts 'Rentals: '
    person_fetch[0].rentals.each do |rental|
      puts "Date: #{rental.date} Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
