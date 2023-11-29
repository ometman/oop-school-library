def handle_choice(choice, app)
  case choice
  when 1
    list_books(app)
  when 2
    list_people(app)
  when 3
    create_person(app)
  when 4
    create_book(app)
  when 5
    create_rental(app)
  when 6
    list_rentals_for_person(app)
  when 7
    puts 'Exiting the app...'
    return true
  else
    puts 'Invalid choice. Please choose a number between 1 and 7.'
  end
  false
end

def list_books(app)
  if app.books.empty?
    puts 'Sorry! no books available'
  else
    app.list_books
  end
end

def list_people(app)
  if app.people.empty?
    puts 'Currently, no person has been added'
  else
    app.list_people
  end
end

def create_person(app)
  print 'Do you want to create a student (1) or teacher (2) [input the number]: '
  input = gets.chomp.to_i
  if input == 1
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print "Has parent's permission? [Y/N]: "
    parent_permission = gets.chomp.downcase == 'y'
    person = Student.new(age, name, parent_permission)
    app.create_person(person, name, 'student')
  elsif input == 2
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name)
    app.create_person(person, name, 'teacher')
  else
    puts 'Invalid input. Please enter either 1 for student or 2 for teacher.'
  end
end

def create_book(app)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.create_book(title, author)
end

def create_rental(app)
  puts 'Select a book from the following list by number'
  app.books.each_with_index do |book, index|
    puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
  end
  book_index = gets.chomp.to_i
  book = app.books[book_index]

  puts 'Select a person from the following list by number (not id)'
  app.people.each_with_index do |person, index|
    person_type = person.is_a?(Student) ? 'Student' : 'Teacher'
    generated_id = person.id
    age = person.age if person.respond_to?(:age)
    puts "#{index}) [#{person_type}], Name: #{person.name}, ID: #{generated_id}, Age: #{age}"
  end
  person_index = gets.chomp.to_i
  person = app.people[person_index]

  print 'Date (YYYY-MM-DD): '
  date = gets.chomp
  app.create_rental(date, book, person)
end

def list_rentals_for_person(app)
  print 'ID of Person: '
  id = gets.chomp.to_i
  app.list_rentals_for_person(id)
end
