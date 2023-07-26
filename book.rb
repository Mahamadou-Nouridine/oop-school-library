class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(rental)
    @rentals << rental unless @rentals.include?(rental)
    rental.book = self
  end
end
