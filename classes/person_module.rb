require_relative 'student'
require_relative 'teacher'

class PersonModule
  attr_accessor :persons, :file_location

  def initialize
    @file_location = 'storage/people.json'
    file = File.open(@file_location, 'a+')
    @persons = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
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
    file = File.open(@file_location, 'w')
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, name, age)
    teacher = teacher.to_json
    person << teacher
    file.write(JSON[person])
    file.close
    puts 'Teacher created successfully'
  end

  def create_student(person, name, age)
    file = File.open(@file_location, 'w')
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
    student = student.to_json
    person << student
    file.write(JSON[person])
    file.close
    puts 'Student created successfully'
  end

  def list_all_people
    puts 'Sorry no people available at the moment' if @persons.empty?
    @persons.each do |person|
      puts "[#{person['json_class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
  end
end
