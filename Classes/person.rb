class Person

    attr_accessor :name
    attr_accessor :age
    attr_reader :id

    def initialize(name="Unknown", age, parent_permission = true)
        @id = Random.rand(1...1000)
        @name = name
        @age = age
    end

    private def is_of_age?
        return true unless @age < 18
    end

    def can_use_services?
        if @age >= 18 || @parent_permission == true
            return true
        end
        return false
    end
end