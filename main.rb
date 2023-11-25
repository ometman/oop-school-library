require_relative 'app'

def display_menu
  puts "\nWelcome to School Library App!"
  puts "\nPlease choose an option by entering a number:"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a given person id'
  puts '7. Exit'
end

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

def main
  app = App.new

  loop do
    display_menu
    print 'Enter your choice: '
    choice = gets.chomp.to_i

    break if handle_choice(choice, app)
  end
end

# Invoke main method
main if __FILE__ == $PROGRAM_NAME
