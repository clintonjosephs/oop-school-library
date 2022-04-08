require './person'
require './student'
require './classroom'
require './rental'
require './book'
require './teacher'

class App
  def list_all_books(books)
    puts 'Sorry no books available at the moment' if books.empty?

    books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_all_people(people)
    puts 'Sorry no people available at the moment' if people.empty?

    people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    if title.strip != '' && author.strip != ''
      book = Book.new(title, author)
      books << book
      puts 'Book created successfully'
    else
      puts 'Must enter title and author to create book'
    end
  end

  def create_person(person)
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    case person_type
    when '2'
      create_teacher(person, name, age)
    when '1'
      create_student(person, name, age)
    else
      puts 'invalid person type selection'
      nil
    end
  end

  def create_teacher(person, name, age)
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, name, age)
    person << teacher
    puts 'Teacher created successfully'
  end

  def create_student(person, name, age)
    print 'Has parent permission? [Y/N]: '
    has_permission = gets.chomp.downcase
    student = ''
    case has_permission
    when 'y'
      student = Student.new(age, name, parent_permission: true)
    when 'n'
      student = Student.new(age, name, parent_permission: false)
    else
      puts 'invalid selection for permission'
      return
    end
    person << student
    puts 'Student created successfully'
  end

  def create_rental(data)
    if data[:books].empty? == true || data[:people].empty? == true
      puts 'Sorry no book or people registered to create rental for'
      return
    end

    puts 'Select a book from the following list by number'

    data[:books].each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }

    book_index = gets.chomp.to_i
    book_obj = data[:books][book_index]

    puts 'Select a person from the following list by number'

    data[:people].each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    person_obj = data[:people][person_index]

    print 'Date: '
    date = gets.chomp

    person_obj.add_rental(book_obj, date)
    puts "New rental created for #{person_obj.name}"
  end

  # the list_rentals method is not working properly
  def list_rentals(people)
    puts 'Sorry no people available at the moment' if people.empty?

    print 'ID of the person: '

    person_id = gets.chomp
    # getting person id from user
    person_fetch = people.select { |person| person.id == person_id }

    puts 'Rentals: '
    # track rentals
    person_fetch[0].rentals[0].each do |rental|
      puts "Date: #{rental.date} Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
