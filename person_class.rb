class Person
  attr_accessor :id, :name, :age

  def initialize(id, age, name = 'UNKNOWN', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public :can_use_services
  
  def can_use_services?
    of_age? || parent_permission
  end
end
