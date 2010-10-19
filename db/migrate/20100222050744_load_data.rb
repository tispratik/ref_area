class LoadData < ActiveRecord::Migration
  def self.up
    if Country.count == 0
      geonames = Db::Geonames.new(
        :countries => "#{Rails.root}/db/geonames/countryInfo.txt",
        :regions => "#{Rails.root}/db/geonames/admin1Codes.txt",
        :cities => "#{Rails.root}/db/geonames/cities15000_US_only.txt"
      )
      geonames.import
    end
  end
end