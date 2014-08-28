class User < ActiveRecord::Base
  has_and_belongs_to_many :breweries
  
  validates_uniqueness_of :name
  
  
end