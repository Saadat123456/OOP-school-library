class Rentals
  attr_accessor :rentals

  def initialize(books, people)
    @rentals = []
    @books = books
    @people = people
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.books.each_with_index do |book, index|
      puts "#{index}) #{@books.create_book_string(book)}"
    end
    book_number = gets.chomp.to_i
    puts ''
    puts 'Select a person from the following list of number (not id)'
    @people.people.each_with_index do |person, index|
      puts "#{index}) #{@people.create_person_string(person)}"
    end
    person_number = gets.chomp.to_i
    puts ''
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @people.people[person_number], @books.books[book_number])
    @rentals << rental
    puts 'Rental created successfully'
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
end
