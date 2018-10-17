#require gems

require "pry"
require 'open-uri'
require 'nokogiri'
# used for namespace, exmaple: class TacosStand::Controller; TacosStand::Controller.new
module TacosStand
  # Your code goes here...
end

#require all files in tacos_stand
require "tacos_stand/version"
require "tacos_stand/first_layer_list.rb"
require "tacos_stand/food_item.rb"
require "tacos_stand/controller.rb"
require "tacos_stand/second_layer_list.rb"
