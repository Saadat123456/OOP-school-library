require_relative '../student'
require_relative '../teacher'
require_relative '../book'
require_relative '../rental'

class App
  def run
    @option = 0
    @books = []
    @people = []
    @rentals = []
    show_menu
  end

  def welcome_message
    puts 'Welcome to School Library App'
    puts ''
  end

  def show_options
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_i
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
    name = gets.chomp.to_i
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

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
    puts ''
  end

  def create_book_string(book)
    "Title: \"#{book.title}\", Author: #{book.author}"
  end

  def create_person_string(person)
    "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) #{create_book_string(book)}"
    end
    book_number = gets.chomp.to_i
    puts ''
    puts 'Select a person from the following list of number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) #{create_person_string(person)}"
    end
    person_number = gets.chomp.to_i
    puts ''
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @people[person_number], @books[book_number])
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_books
    if @books.empty?
      puts 'No Books Found.'
    else
      @books.each do |book|
        puts create_book_string(book)
      end
    end
    puts ''
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

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.person.name}" if rental.person.id == id
    end
    puts ''
  end

  def run_user_command
    case @option
    when 1
      list_books
    when 2
      list_peoples
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      puts list_rentals
    end
  end

  def show_menu
    welcome_message
    while @option != 7
      show_options
      @option = gets.chomp.to_i
      run_user_command if @option != 7
    end
  end
end
