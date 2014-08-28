class Brewery < ActiveRecord::Base
  has_many :beers
  has_and_belongs_to_many :users
  
  validates_uniqueness_of :name
  
  # reverse_geocoded_by :latitude, :longitude
 #  after_validation :reverse_geocode  # auto-fetch address
 #
 #  field :coordinates, :type => Array
 #  field :address
  
  
  # def self.create_brewery_array
#     b = self.all
#     brew_array = []
#     i = 1
#
#     until i == b.length
#       brew_array << self.find(i).name
#       i = i + 1
#     end
#     brew_array
#   end
  
  
end