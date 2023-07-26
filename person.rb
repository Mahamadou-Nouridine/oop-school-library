require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Time.new.to_i
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_service
    of_age || @parent_permission
  end

  def rent_book(rental)
    @rentals << rental unless @rentals.include?(rental)
    rental.person = self
  end

  private

  def of_age
    @age >= 18
  end
end
