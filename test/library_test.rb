require './test/test_helper'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test
  def test_it_exists
    dpl = Library.new
    assert_instance_of(Library, dpl)
  end

  def test_books_is_empty
    dpl = Library.new
    assert_equal [], dpl.books
  end

  def test_add_to_collections_adds_books
    dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(jane_eyre)
    assert_includes(dpl.books, jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    assert_includes(dpl.books, mockingbird)
    assert_includes(dpl.books, villette)
  end

  def test_library_includes_books
    dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    assert dpl.include?("To Kill a Mockingbird")
    refute dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_card_catalogue_returns_books_sorted_by_last_name
    dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    assert_equal "Bronte", dpl.card_catalogue[0].author_last_name
    assert_equal "Bronte", dpl.card_catalogue[1].author_last_name
    assert_equal "Lee", dpl.card_catalogue[2].author_last_name
  end

  def test_find_book_by_author
    dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    assert_includes(dpl.find_by_author("Charlotte Bronte"), "Jane Eyre")
    assert_includes(dpl.find_by_author("Charlotte Bronte"), "Villette")
    assert_includes(dpl.find_by_author("Harper Lee"), "To Kill a Mockingbird")
  end

  def test_find_by_publication_date
    dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    assert_includes(dpl.find_by_publication_date("1960"), "To Kill a Mockingbird")
  end
end
