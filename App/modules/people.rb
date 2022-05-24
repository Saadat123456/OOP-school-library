class People
  attr_accessor :people

  def initialize
    @people = []
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    student = Student.new(age, 0, name, parent_permission: %w[Y y].include?(permission))
    @people << student
    puts 'Person creaed successfully'
    puts ''
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts 'Person created successfully'
    puts ''
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_person_string(person)
    "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  def list_peoples
    if @people.empty?
      puts 'No People Found.'
    else
      @people.each do |person|
        puts create_person_string(person)
      end
    end
    puts ''
  end
end
