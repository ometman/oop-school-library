require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'UNKNOWN')
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_service
    true
  end
end
