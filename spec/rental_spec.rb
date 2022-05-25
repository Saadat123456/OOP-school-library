require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  before :all do
    @book = Book.new('Abc', 'Xyz')
    @student = Student.new(14, 6, 'Neira', parent_permission: false)
    @rental = Rental.new('19/01/05', @student, @book)
  end
  context 'Testing rental Class' do
    it 'Should have date 19/01/05' do
      date = @rental.date
      expect(date).to eql '19/01/05'
    end

    it 'Should have person named Neira' do
      person_name = @rental.person.name
      expect(person_name).to eql 'Neira'
    end

    it 'Should have book named Abc' do
      book_title = @rental.book.title
      expect(book_title).to eql 'Abc'
    end
  end
end
