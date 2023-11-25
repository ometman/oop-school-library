require_relative 'app'

def main
  app = App.new

  loop do
    puts "\nChoose an option:"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List rentals for a person"
    puts "7. Quit"

    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      print "Enter name of person: "
      name = gets.chomp
      print "Enter person type (teacher/student): "
      type = gets.chomp.downcase
      app.create_person(name, type)
    when 4
      print "Enter book's title: "
      title = gets.chomp
      print "Enter book's author: "
      author = gets.chomp
      app.create_book(title, author)
    when 5
      print "Enter rental date (YYYY-MM-DD): "
      date = gets.chomp
      app.list_books
      print "Enter book index: "
      book_index = gets.chomp.to_i
      app.list_people
      print "Enter person index: "
      person_index = gets.chomp.to_i
      app.create_rental(date, book_index, person_index)
    when 6
      app.list_people
      print "Enter index of person to list rentals: "
      person_index = gets.chomp.to_i
      app.list_rentals_for_person(person_index)
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
