def handle_choice(choice, app)
  case choice
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    create_person(app)
  when 4
    create_book(app)
  when 5
    app.create_rental
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

def create_person(app)
  print 'Do you want to create a student (1) or teacher (2) [input the number]: '
  input = gets.chomp.to_i
  if input == 1
    app.create_person('student')
  elsif input == 2
    app.create_person('teacher')
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

def list_rentals_for_person(app)
  print 'ID of Person: '
  id = gets.chomp.to_i
  app.list_rentals_for_person(id)
end
