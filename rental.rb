require_relative './book'
require_relative './person'
require 'json'

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
      JSON.create_id => self.class.name,
      'a' => [@date, @person, @book]
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
