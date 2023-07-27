require_relative 'app'

def main
  puts 'Welcome to School library App!'
  app = App.new
  loop do
    puts '

Please enter a number: '

    @content = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person (teacher or student)',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }
    @content.each { |index, string| puts "#{index} - #{string}" }

    option = gets.chomp.to_i
    case option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals_by_person_id
    when 7
      puts 'You made a good choice'
      exit
    else
      puts 'You are out of range'
    end
  end
end

main
