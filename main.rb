require './person'
require './student'
require './classroom'
require './rental'
require './book'
require './teacher'

classroom = Classroom.new('JS 2 A')
student1 = Student.new(18, 'JS2 A', :name => 'Clinton', :parent_permission => false)

puts student1.play_hooky
puts classroom.label
puts student1.classroom = classroom
print classroom.student
puts ' '

student2 = Student.new(21, 'JS2 A', :name => 'John', :parent_permission => true)
student2.classroom = classroom

print classroom.student.map { |student| student.name }

book1 = Book.new("Harry Potter", "John Benner");
book2 = Book.new("React Redux, a common sense approach", "Clinton Mbonu")
book3 = Book.new("How to get away with profit", "Mercy green")

rental1 = Rental.new(book1, student1)
rental2 = Rental.new(book2, student2)
rental3 = Rental.new(book3, student1)
rental4 = Rental.new(book1, student2)

puts ' '
print rental1.person

puts ' '
print rental3.person

puts ' '
print book1.rentals.map { |rental| rental.person.name }


