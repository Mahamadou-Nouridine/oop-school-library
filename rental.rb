class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def set_book(book)
    @book = book
    book.rentals << self unless book.rentals.include?(self)
  end

  def set_person(person)
    @person = person
    person.rentals << self unless person.rentals.include?(self)
  end
end
