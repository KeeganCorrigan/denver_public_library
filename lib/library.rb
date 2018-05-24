class Library
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    titles = books.map do |book|
      book.title
    end
    titles.include?(title)
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end

  def find_by_author(author)
    author_first_and_last = author.split(' ')
    sorted_by_author = @books.find_all do |book|
      book.author_last_name.include?(author_first_and_last[1])
    end
    return convert_array_to_hash_for_books(sorted_by_author)
  end

  def find_by_publication_date(year)
    sorted_by_date = @books.find_all do |book|
      book.publication_date == year
    end
    return convert_array_to_hash_for_books(sorted_by_date)
  end

  def convert_array_to_hash_for_books(sorted_books)
    converted = {}
    sorted_books.each_with_index do |information, index|
      converted[information.title] = sorted_books[index]
    end
    return converted
  end
end
