class Person
    attri_ reader :id, :name, :age
    attri_writer :name, :age
    def initialize(_name, age, _parent_permission)
      @id = id
      @name = 'UNKNOWN'
      @age = age
      @parent_permission = true
    end
  
    def of_age?
      @age >= 18
    end
  
    def can_use_services?
      of_age? || parent_permission
    end
  end
  