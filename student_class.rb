require_relative 'person_class'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, classroom, name = 'UNKNOWN', parent_permission: true)
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
