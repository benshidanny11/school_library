require_relative './person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super()
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  @classroom = classroom
   if(!classroom.students.include?(self)){
    classroom.students.push(self)
   }
 
end
