require_relative 'app'
require_relative 'student'
require_relative 'teacher'
require_relative 'menu'
require_relative 'actions'
require_relative 'person'
require 'json'

app = App.new

def save_library_data(filename, data)
  File.open(filename, 'w') { |file| file.write(JSON.generate(data))}
end

def load_book_data(filename)
  return [] unless File.exist?(filename)
  # JSON.parse(File.read(filename))
  book_data = JSON.parse(File.read(filename))
  book_data.map { |book| Book.new(book['title'], book['author']) }
end

def load_people_data(filename)
  return [] unless File.exist?(filename)
  # JSON.parse(File.read(filename))
  people_data = JSON.parse(File.read(filename))
  people_data.map { |person| Person.new(person['name']) }
end

def load_rentals_data(filename)
  return [] unless File.exist?(filename)
  # JSON.parse(File.read(filename))
  rentals_data = JSON.parse(File.read(filename))
  rentals_data.map { |rental| Rental.new(rental['date'], rental['book'], rental['person']) }
end

app.books = load_book_data('books.json')
app.rentals = load_rentals_data('rentals.json')
app.people = load_people_data('people.json')

def save_at_exit(app)
  save_library_data('books.json', app.books)
  save_library_data('rentals.json', app.rentals)
  save_library_data('people.json', app.people)
end

def main(app)

  loop do
    display_menu
    print 'Enter your choice: '
    choice = gets.chomp.to_i

    break if handle_choice(choice, app)
  end

  at_exit { save_at_exit(app) }

end

# Invoking the main method
main(app) if __FILE__ == $PROGRAM_NAME
