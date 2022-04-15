require 'json'
require_relative 'book'

class BookModule
  attr_accessor :books
  attr_reader :file_location

  def initialize
    @file_location = 'storage/books.json'
    file = File.open(@file_location, 'a+')
    @books = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
  end

  def list_all_books
    puts 'Sorry no books available at the moment' if books.empty?
    @books.each { |book| puts "Title: \"#{book['title']}\", Author: #{book['author']}" }
  end

  def create_book
    file = File.open(@file_location, 'w')
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    if title.strip != '' && author.strip != ''
      book = Book.new(title, author)
      book = book.to_json
      @books << book
      file.write(JSON[@books])
      file.close
      puts 'Book created successfully'
    else
      puts 'Must enter title and author to create book'
    end
  end
end
