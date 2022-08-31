require_relative './app_controller_interface'
require_relative '../modules/books'
require_relative '../modules/people'
require_relative '../modules/rentals'
require_relative '../modules/storage'
require_relative '../../book'
require_relative '../../student'
require_relative '../../teacher'

class AppController < AppControllerInterface
  def initialize
    super
    @books = Books.new
    @people = People.new
    @rentals = Rentals.new(@books, @people)
    @storage = Storage.new
    books_array = @storage.load_data('books')
    books_array.each do |book|
      @books.books << JSON.parse(book.to_json, create_additions: true)
    end
    people_array = @storage.load_data('people')
    people_array.each do |person|
      @people.people << JSON.parse(person.to_json, create_additions: true)
    end
    rentals_array = @storage.load_data('rentals')
    rentals_array.each do |rental|
      @rentals.rentals << JSON.parse(rental.to_json, create_additions: true)
    end
  end

  def run_user_command(option)
    case option
    when 1
      @books.list_books
    when 2
      @people.list_peoples
    when 3
      @people.create_person
      @storage.save_data('people', @people.people)
    when 4
      @books.create_book
      @storage.save_data('books', @books.books)
    when 5
      @rentals.create_rental
      @storage.save_data('rentals', @rentals.rentals)
    when 6
      puts @rentals.list_rentals
    end
  end
end
