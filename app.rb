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
    if @books.empty?
      puts 'Sorry! No books available'
    else
      puts 'Available Books:'
      @books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'Currently, no person has been added'
    else
      puts 'All People:'
      @people.each_with_index do |person, index|
        puts "#{index + 1}. #{person.name}"
      end
    end
  end

  def create_person(type)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    case type.downcase
    when 'teacher'
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
    when 'student'
      print "Has parent's permission? [Y/N]: "
      parent_permission = gets.chomp.downcase == 'y'
      person = Student.new(age, name, parent_permission)
    else
      puts 'Invalid input.'
      return
    end

    @people << person
    puts "Person(#{type.capitalize}) '#{name}' created successfully."
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "New book: '#{title}' by #{author} created successfully."
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    book = @books[book_index]

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      person_type = person.is_a?(Student) ? 'Student' : 'Teacher'
      generated_id = person.id
      age = person.age if person.respond_to?(:age)
      puts "#{index}) [#{person_type}], Name: #{person.name}, ID: #{generated_id}, Age: #{age}"
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]

    print 'Date (YYYY-MM-DD): '
    date = gets.chomp

    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |person| person.id == person_id }
    if person.nil?
      puts 'Sorry, no person has that Id.'
      return
    end

    person_rentals = @rentals.select { |rental| rental.person == person }
    if person_rentals.empty?
      puts 'No rentals found'
      return
    end

    puts 'Rentals: '
    person_rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
