class Student < Person

    attr_reader :classroom
    attr_writer :classroom

    def initialize(id, age, name = "Unknown", parent_permission = true, classroom)
      super(id, name, age, parent_permission)
      @classroom = classroom
    end
  
    def play_hooky
      "¯\\_(ツ)_/¯"
    end
end