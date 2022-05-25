require_relative './person'
require 'json'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def as_json()
    {
      JSON.create_id => self.class.name,
      'a' => [@age, @classroom, @name]
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    age, classroom, name, parent_permission = object['a']
    new(age, classroom, name, parent_permission: parent_permission)
  end
end
