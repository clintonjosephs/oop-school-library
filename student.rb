require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = nil
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
