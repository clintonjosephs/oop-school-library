require './classes/app'

def main
  puts 'Welcome to School Library App'
  school = App.new
  school.menu_selection
end

main
