require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  attr_accessor :book, :rental, :people

  def initialize
      @books = []
      @rentals = []
      @people = []
  end

  def list_books
      puts "Available Books:"
      @books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} by #{book.author}"
      end
  end

  def list_people
      puts "All People:"
      @people.each do |person, index|
        puts "#{index + 1}. #{person.name}"
      end
  end
  
  def create_person(age, name, type)
    if type.downcase == 'teacher'
      person = Teacher.new(age, specialization, name)
    elsif type.downcase == 'student'
      person = Student.new(age, classroom, name)
    else
      puts "Invalid person type."
      return
    end
    @people << person
    puts "#{type.capitalize} '#{name}' created."
  end
  
  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "New book: '#{title}' by #{author} created."
  end

  def create_rental(date, book_index, person_index)
    book = @books[book_index - 1]
    person = @people[person_index - 1]

    if book.nil? || person.nil?
      puts "Invalid book or person index."
      return
    end

    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental created for '#{person.name}' on '#{book.title}' (#{date})."
  end

  def list_rentals_for_person(person_index)
    person = @people[person_index - 1]
    if person.nil?
      puts "Invalid person index."
      return
    end

    person_rentals = @rentals.select { |rental| rental.person == person }
    if person_rentals.empty?
      puts "No rentals found for '#{person.name}'."
      return
    end

    puts "All rentals for '#{person.name}':"
    person_rentals.each do |rental|
      puts "- #{rental.book.title} (#{rental.date})"
    end
  end
end

app = App.new

# List all books initial.
puts app.list_books

# List all people.
puts app.list_people

# Create a person (teacher or student, not a plain Person).
puts app.create_person(34, 'Andy Van', 'teacher')
# list people after adding a person
puts app.list_people 

# Create a book.
puts app.create_book('Understanding Ruby Classes', 'Ometman')
# list book after adding
puts app.list_books 

# Create a rental.
puts app.create_rental(12-12-2023, 1, 1)


# List all rentals for a given person id.
puts app.list_rentals(1)


