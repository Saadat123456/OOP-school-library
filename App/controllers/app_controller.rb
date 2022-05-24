require_relative './app_controller_interface'
require_relative '../modules/books'
require_relative '../modules/people'
require_relative '../modules/rentals'

class AppController < AppControllerInterface
  def initialize
    super
    @books = Books.new
    @people = People.new
    @rentals = Rentals.new(@books, @people)
  end

  def run_user_command(option)
    case option
    when 1
      @books.list_books
    when 2
      @people.list_peoples
    when 3
      @people.create_person
    when 4
      @books.create_book
    when 5
      @rentals.create_rental
    when 6
      puts @rentals.list_rentals
    end
  end
end
