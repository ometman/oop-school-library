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
    if @books.length.zero? 
      puts "No books available"
    else
      puts "Available Books:"
        @books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} by #{book.author}"
      end
    end
  end

  def list_people
    if @people.length.zero? 
      puts "Currently, no person has been added"
    else
      puts "All People:"
      @people.each do |person, index|
        puts "#{index + 1}. #{person.name}"
      end
    end
  end
  
  def create_person(name, type)
    if type.downcase == 'teacher'
      puts "What is the teacher's age"
      age = gets.chomp_i
      puts "Enter teacher's specialization"
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
    elsif type.downcase == 'student'
      puts "What is the student's age"
      age = gets.chomp_i
      puts "Enter student's classroom"
      classroom = gets.chomp
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


