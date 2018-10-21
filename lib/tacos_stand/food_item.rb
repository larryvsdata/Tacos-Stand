

class TacosStand::FoodItem
  attr_accessor :desc , :title , :price

  def initialize (food_hash)
    food_hash.each do |k , v|
      self.send("#{k}=" , v)

    end


  end

def print_name_desc
 puts "#{@title} : #{@desc}"
end

def print_name_price
 puts "#{@title} : #{@price}"
end
def get_name_price
 "#{@title} : #{@price}"
end

def print_all
  self.print_name_price
  print @desc
end


end


#my_hash ={:desc=>"Flame grilled Angus steak (100% Certified Angus Beef), cilantro, onions, guacamole & salsa", :title=>"Carne Asada", :price=>"$3.49"}

#fi = FoodItem.new(my_hash)

#fi.print_all
