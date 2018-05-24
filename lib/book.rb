require 'pry'

class Book
  attr_reader :author_first_name, :author_last_name, :title, :publication_date

  def initialize(book_information)
    @author_first_name = book_information[:author_first_name]
    @author_last_name = book_information[:author_last_name]
    @title = book_information[:title]
    @publication_date = book_information[:publication_date][-4..-1]
  end

end
