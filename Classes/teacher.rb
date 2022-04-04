require './person.rb'

class Teacher < Person
    def initialize(name='Unknown', specialization, age: 0, parent_permission: true)
        super(name, age, parent_permission)
        @specialization = specialization
    end

    def can_use_services?
       true
    end
end