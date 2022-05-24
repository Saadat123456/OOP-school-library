require_relative './person'

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
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      specialization: @specialization
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
