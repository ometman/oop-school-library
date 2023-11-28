require_relative 'app'
require_relative 'menu'
require_relative 'actions'

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
