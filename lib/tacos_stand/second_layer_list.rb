#require_relative "first_layer_list.rb"


class SecondLayer
attr_accessor  :sub_title , :titles , :descs  , :prices , :size , :hash_list , :food_item_list

def initialize(sub_title = "" , titles = [] , descs = [] , prices = [])
@sub_title = sub_title
@titles = titles
@descs = descs
@prices =prices
@hash_list = []
@food_item_list = []
end

def set_size

size_array = [titles.length , descs.length , prices.length]
@size =size_array.min

end


def set_hash_list
ii = 0

while ii < @size
food_hash = {}
food_hash[:desc] = @descs[ii]
food_hash[:title] = @titles[ii]
food_hash[:price] = @prices[ii]
@hash_list << food_hash
ii +=1
end
end


def fillup_food_items
@hash_list.each do |h|
@food_item_list<< FoodItem.new(h)
end
end


def second_wrapper
  self.set_size
  self.set_hash_list
  self.fillup_food_items

end


def print_names_prices
puts @sub_title
@food_item_list.each_with_index  { |item, ind| puts "#{ind+1}. #{item.get_name_price}"}
end

def print_desc (item_number)
@food_item_list[item_number-1].print_name_desc
end

def print_subtitle
  puts @subtitle
end


end
