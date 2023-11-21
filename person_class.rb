class Person
  attr_accessor :id, :name, :age

  def initialize(age, name: 'UNKNOWN', parent_permission: true)
    @id = rand(1...100)
    @name = name
    @age = age
    @parent_permission = parent_permission
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
