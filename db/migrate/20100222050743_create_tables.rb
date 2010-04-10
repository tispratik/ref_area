class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.integer :geoname_id
      t.string :iso2
      t.string :iso3
      t.integer :ison
      t.string :name
      t.string :capital
      t.string :area
      t.string :continent
      t.string :currency_code
      t.string :currency_name
      t.string :phone
    end
    
    add_index :countries, :geoname_id
    
    create_table :regions do |t|
      t.references :country
      t.string :name
      t.string :iso
    end
    
    add_index :regions, :country_id
    
    create_table :cities do |t|
      t.integer :geoname_id
      t.references :country
      t.references :region
      t.string :name
      t.string :name_ascii
      t.string :lat
      t.string :lng
      t.string :time_zone
    end
    
    add_index :cities, :geoname_id
    add_index :cities, :country_id
    add_index :cities, :region_id
  end
end
