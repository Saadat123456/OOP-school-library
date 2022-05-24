require_relative './rental'

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
      title: @title,
      author: @author
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
