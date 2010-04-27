class LoadData < ActiveRecord::Migration
  def self.up
    if Country.count == 0
      geonames = Db::Geonames.new(
        :countries => "#{RAILS_ROOT}/db/geonames/countryInfo.txt",
        :regions => "#{RAILS_ROOT}/db/geonames/admin1Codes.txt",
        :cities => "#{RAILS_ROOT}/db/geonames/cities15000_US_only.txt"
      )
      geonames.import
    end
  end
end