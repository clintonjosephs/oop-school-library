require './student'
require './teacher'

class PersonModule
  attr_accessor :persons

  def initialize(persons)
    @persons = persons
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    case person_type
    when '2'
      create_teacher(@persons, name, age)
    when '1'
      create_student(@persons, name, age)
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

  def list_all_people
    puts 'Sorry no people available at the moment' if @persons.empty?
    @persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end
end
