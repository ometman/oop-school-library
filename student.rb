require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'UNKNOWN', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self) if classroom
  end
  def classroom=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom.students << self if classroom
  end
  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
