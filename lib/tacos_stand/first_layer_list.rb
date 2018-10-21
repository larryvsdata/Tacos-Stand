


class TacosStand::FirstLayer

attr_accessor :website , :main_page , :sub_titles , :all_titles , :all_descs , :all_prices
attr_accessor :second_layers

@@all = []

def initialize
  @website = "http://www.letstaco.com/index.html#menu-online"
  @main_page = Nokogiri::HTML(open(@website))
  @sub_titles = []
  @all_titles = []
  @all_descs = []
  @all_prices = []
  @second_layers = []
  @@all << self
end

def self.all
 @@all
end

def fillup_lists

  menu_modals = @main_page.css("div.menu-modal-section")

  menu_modals.each do |menu_modal|
  @sub_titles << menu_modal.css("img").attr("alt").value
  titles = []
  descs = []
  prices = []

  menu_modal.css(".menu-modal-item-title").each do |title|
  titles << title.text
  end

  menu_modal.css(".menu-modal-item-desc").each do |desc|
  descs << desc.text
  end

  menu_modal.css(".menu-modal-item-price").each do |price|
  prices << price.text
  end
  @all_titles << titles
  @all_descs << descs
  @all_prices << prices

  end

end


def build_second_layers
  ind = 0

  while ind < @sub_titles.size
    second_l = TacosStand::SecondLayer.new(@sub_titles[ind] , @all_titles[ind] , @all_descs[ind] , @all_prices[ind] )
    second_l.second_wrapper
    @second_layers << second_l
    ind +=1
  end

end

def first_wrapper
  self.fillup_lists
  self.build_second_layers

end

def print_subtitles
  @second_layers.each_with_index{ |layer , ind| puts "#{ind+1}. #{layer.sub_title}" }

end

def list_names_prices (ind)
    @second_layers[ind-1].print_names_prices
end

def print_desc (ind1 , ind2 )
    @second_layers[ind1-1].food_item_list[ind2-1].print_all
end

end
