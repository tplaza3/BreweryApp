class CreateInitialTables < ActiveRecord::Migration
  def change
    
    create_table :users do |t|
      t.string :name
    end
    
    create_table :breweries do |t|
      t.string :name
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
    end
    
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.integer :rating
      t.string :comments
      t.integer :brewery_id
    end
    
    create_table :breweries_users do |t|
      t.integer :brewery_id
      t.integer :user_id
    end
        
  end
end
