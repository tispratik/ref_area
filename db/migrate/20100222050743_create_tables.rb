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
    
    create_table :decodes do |t|
      t.string :name
      t.string :constant_value
      t.string :display_value
      t.integer :sort_order
      t.integer :is_active
    end
    
    create_table :industries do |t|
      t.string :name
    end
    
    create_table :specific_industries do |t|
      t.string :name
      t.references :industry
    end
    
    add_index :specific_industries, :industry_id
    
    create_table :carriers do |t|
      t.string :code
      t.string :display_text
      t.references :country
      t.string :email
    end
    
  end
end
