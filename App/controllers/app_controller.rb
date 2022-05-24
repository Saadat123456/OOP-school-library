require_relative './app_controller_interface'
require_relative '../modules/books'
require_relative '../modules/people'
require_relative '../modules/rentals'
require_relative '../modules/storage'

class AppController < AppControllerInterface
  def initialize
    super
    @books = Books.new
    @people = People.new
    @rentals = Rentals.new(@books, @people)
    @storage = Storage.new
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
