require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'specialization' => @specialization,
      'parent_permission' => @parent_permission
    }
  end
end
