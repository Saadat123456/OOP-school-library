class Books
  attr_accessor :books

  def initialize
    @books = []
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
    puts ''
  end

  def list_books
    if @books.empty?
      puts 'No Books Found.'
    else
      @books.each do |book|
        puts create_book_string(book)
      end
    end
    puts ''
  end

  def create_book_string(book)
    "Title: \"#{book.title}\", Author: #{book.author}"
  end
end
