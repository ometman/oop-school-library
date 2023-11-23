require_relative 'nameable'

class Person < Nameable
  attr_accessor :id, :name, :age

  def initialize(age, name = 'UNKNOWN', parent_permission = true)
    super()
    @id = rand(1...100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end