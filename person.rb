require './interface'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission = true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    @rentals << Rental.new(self, book, date)
  end

  private :of_age?
end
