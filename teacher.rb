require_relative './person'
require 'json'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end

  def as_json()
    {
      JSON.create_id => self.class.name,
      'a' => [@age, @specialization, @name]
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    age, specialization, name, parent_permission = object['a']
    new(age, specialization, name, parent_permission: parent_permission)
  end
end
