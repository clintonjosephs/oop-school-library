require './person'
require './student'
require './classroom'
require './rental'
require './book'
require './teacher'

classroom = Classroom.new('JS 2 A')
student = Student.new(18, 'JS2 A', :name => 'Clinton', :parent_permission => false)

puts student.play_hooky
puts classroom.label
puts student.classroom = classroom
print classroom.student
