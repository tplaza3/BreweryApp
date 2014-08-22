class User < ActiveRecord::Base
  has_and_belongs_to_many :breweries
  
  def name_duplicate(name)
  end
  
  
end