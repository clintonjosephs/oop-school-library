require './book'

class BookModule
  attr_accessor :books

  def initialize(books)
    @books = books
  end

  def list_all_books
    puts 'Sorry no books available at the moment' if books.empty?
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    if title.strip != '' && author.strip != ''
      book = Book.new(title, author)
      @books << book
      puts 'Book created successfully'
    else
      puts 'Must enter title and author to create book'
    end
  end
end
