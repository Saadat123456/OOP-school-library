require_relative './book'
require_relative './person'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    person.rentals << self
    book.rentals << self
  end

  def as_json()
    {
      date: @date,
      person: @person.to_json,
      book: @book.to_json
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
