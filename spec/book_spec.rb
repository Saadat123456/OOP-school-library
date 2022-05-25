require_relative '../book'

describe Book do
  before :all do
    @book = Book.new('Abc', 'Xyz')
  end
  context 'Testing Book Class' do
    it 'Should have title Abc' do
      title = @book.title
      expect(title).to eq 'Abc'
    end

    it 'Should have Author Xyz' do
      author = @book.author
      expect(author).to eq 'Xyz'
    end
  end
end
