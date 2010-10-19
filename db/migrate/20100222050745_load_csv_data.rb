require 'csv'

class LoadCsvData < ActiveRecord::Migration
  def self.up
    
    #    FasterCSV.foreach( "#{Rails.root}/db/seed/csv/industries.csv") do |line|
    #      Industry.create!(:name => line[0])
    #    end
    
    puts "Loading Industry data..."
    CSV.foreach( "#{Rails.root}/db/seed/csv/industries.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      Industry.create!(line.to_hash)
    end

    puts "Loading SpecificIndustry data..."
    ind = nil
    CSV.foreach( "#{Rails.root}/db/seed/csv/specific_industries.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      
      if ind != line[0]
        ind = Industry.find_by_name(line[0])
      end
            
      SpecificIndustry.create!(:industry => ind, :name => line[1])
    end
    
  end
end
