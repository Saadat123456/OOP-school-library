require_relative './book'
require_relative './person'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    person.add_rental(date, book)
    book.add_rental(date, person)
  end
end
