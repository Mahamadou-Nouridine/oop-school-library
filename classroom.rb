class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student) unless students.include? student
    student.assign_classroom(self)
  end
end
