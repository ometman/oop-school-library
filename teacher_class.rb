require_relative 'person_class'

class Teacher < Person

    attr_reader :specialization

    def initialize(id, age, name = "Unknown", specialization)
      super(id, name, age)
      @specialization = specialization
    end
  
    def can_use_services
      true
    end
end