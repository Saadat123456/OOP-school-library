require_relative './rental'
require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end

  def as_json()
    {
      JSON.create_id => self.class.name,
      'a' => [@title, @author]
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
