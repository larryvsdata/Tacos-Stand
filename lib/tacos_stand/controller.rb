
class TacosStand::Controller
attr_accessor  :first_layer

  def initialize
    @first_layer = TacosStand::FirstLayer.new
    @first_layer.first_wrapper
  end


  def welcome
    puts ""
    puts "Welcome to Tacos Stand!"
    puts "To list all sub menus type 'View Menu'."
    puts "To list all items in a sub-menu type 'List Items' and type the number of the sub-menu."
    puts "To see the description of an item in any sub-menu, type 'Describe'  and then the number of the sub-menu & the number of the item. "
    puts "To exit, type 'exit' ."
    puts ""

  end

  def menu

    self.welcome
    choice = gets.strip.downcase
    puts ""
    #binding.pry


    while choice != 'exit'

      case choice
      when "exit"
        break
      when 'view menu'
        self.sub_menus
      when 'list items'
        self.print_submenu
      when "describe"
        self.describe_item
      else
        puts "Wrong choice. Please re-enter"
      end
      puts ""
      puts ""
      self.welcome
      choice = gets.strip.downcase
    end

  end

def sub_menus
  @first_layer.print_subtitles
end

def print_submenu
    puts "Enter the number of the submenu (between 1 and #{@first_layer.sub_titles.length}):"
    number = gets.strip.to_i
    @first_layer.list_names_prices (number)
end

def describe_item
    puts "Enter the number of the submenu between 1 and #{@first_layer.sub_titles.length}:"
    ind1 = gets.strip.to_i
    puts "Enter the number of the item between 1 and #{@first_layer.all_descs[ind1-1].length}:"
    ind2 = gets.strip.to_i
    @first_layer.print_desc(ind1 , ind2 )
end

end
#TacosStand::Controller.new.menu
