class Country < ActiveRecord::Base
  has_many :regions
  has_many :cities
  
  default_scope :order => :name
  
  def before_create
    self.id = ison
  end
  
  def self.get_flag(iso2)
    iso2 = iso2.downcase
    "flags/small/" + iso2 + ".gif"
  end
  
  def self.get_flag_by_name(name)
    "flags/medium/" + name.sub(' ', '_') + ".png"
  end
  
  def self.get_flag_from_iso3(iso3)
    country = Country.find_by_iso3(iso3)
    return get_flag(country.iso2)
  end
  
  def self.get_flag_from_ison(ison)
    country = Country.find_by_ison(ison)
    return get_flag(country.iso2)
  end
  
end
