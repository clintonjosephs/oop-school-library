require_relative 'interface'

class Person < Nameable
  attr_accessor :name, :age, :id
  attr_reader :rentals, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
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
    @rentals.push(Rental.new(date, book, self)) unless @rentals.include?(Rental.new(date, book, self))
  end

  private :of_age?
end
