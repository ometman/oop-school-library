require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  attr_accessor :books, :rentals, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_books
    puts 'Available Books:'
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    puts 'All People:'
    @people.each_with_index do |person, index|
      puts "#{index + 1}. #{person.name}"
    end
  end

  def create_person(person, name, type)
    @people << person
    puts "Person(#{type.capitalize}) '#{name}' created successfully."
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "New book: '#{title}' by #{author} created successfully."
  end

  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |theperson| theperson.id == person_id }
    person_rentals = @rentals.select { |rental| rental.person == person }
    puts 'Rentals: '
    person_rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
