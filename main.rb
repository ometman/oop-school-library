require_relative 'app'

def main
  app = App.new

  loop do
    puts "\nWelcome to School Library App!"
    puts "\n"
    puts "\nPlease choose an option by entering a number:"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List rentals for a given person id"
    puts "7. Exit"

    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      print "Do you want to create a student (1) or teacher (2) [input the number]: "
      input = gets.chomp.to_i
      if input == 1
        app.create_person('student')
      elsif input == 2
        app.create_person('teacher')
      else
        puts "Invalid input. Please enter either 1 for student or 2 for teacher."
      end    
    when 4
      print "Title: "
      title = gets.chomp
      print "Author: "
      author = gets.chomp
      app.create_book(title, author)
    when 5
      app.create_rental
    when 6
      print "ID of Person: "
      id = gets.chomp.to_i
      app.list_rentals_for_person(id)
    when 7
      puts "Exiting the app..."
      break
    else
      puts "Invalid choice. Please choose a number between 1 and 7."
    end
  end
end

# Invoke main method
main if __FILE__ == $PROGRAM_NAME
