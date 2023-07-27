require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
  end

  def list_books
    puts 'No book!' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    puts 'No person found!' if @people.empty?
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def list_rentals_by_person_id
    print 'ID of person:'
    id = gets.chomp.to_i
    person = @people.find { |pers| pers.id == id }
    if person.nil?
      puts 'Person not found'
    else
      puts 'Rentals'
      puts "The given person doesn't rent any book" if person.rentals.empty?
      person.rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" }
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]:'
    type = gets.chomp.to_i
    case type
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Has parent permission? [Y/N]:'
    permission = gets.chomp.downcase
    parent_permission = true
    case permission
    when 'n'
      parent_permission = false
    when 'y'
      parent_permission = true
    else
      puts 'Out of range!'
    end
    @people << Student.new(age, nil, name, parent_permission: parent_permission)
    puts 'you have successfully registered a student!'
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name)
    puts 'you have successfully registered a teacher!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    puts 'Book created successfully'
    @books << Book.new(title, author)
  end

  def create_rental
    if @books.empty?
      puts 'No book to rent!'
    elsif @people.empty?
      puts 'No person found To rent a book!'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      book_number = gets.chomp.to_i
      if book_number >= @books.length
        puts 'Out of range!'
      else
        puts 'Select a person from the following list by number'
        @people.each_with_index do |person, index|
          puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
        person_number = gets.chomp.to_i
        if person_number >= @people.length
          puts 'Out of range!'
        else
          # puts 'Enter date [YYYY-MM-DD]'
          # date = gets.chomp.to_s
          date = get_user_input('Enter date [YYYY-MM-DD]').to_s
          rental = Rental.new(date, book, person)
          save_rental_data(@books[book_number], @people[person_number], rental)
        end
      end
    end
  end

  def get_user_input(message)
    puts message
    gets.chomp
  end

  def save_rental_data(book, person, rental)
    person.rent_book(rental)
    book.add_rentals(rental)
    puts 'Rental created successfuly'
  end
end

# app = App.new()
# app.create_person
# app.list_people
# app.create_book
# app.list_books
# app.create_rental
# app.list_rentals_by_person_id
