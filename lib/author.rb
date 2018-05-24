require './lib/book'

class Author
  attr_reader :books

  def initialize(author_information)
    @first_name = author_information[:first_name]
    @last_name = author_information[:last_name]
    @books = []
  end

  def add_book(title, publication_date)
    book_information = {}
    book_information[:author_first_name] = @first_name
    book_information[:author_last_name] = @last_name
    book_information[:title] = title
    book_information[:publication_date] = publication_date[-4..-1]
    book = Book.new(book_information)
    @books << book
    book
  end
end
