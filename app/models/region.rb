class Region < ActiveRecord::Base
  belongs_to :country
  has_many :cities
  
  default_scope :order => :name
  
  def self.find_active_states_by_country(country_id)
    @states = all(:conditions => ["country_id=? and is_active=?", country, level, is_active], :order => "sort_order")
  end

  def self.find_active_states_by_country_name(country_name)
    country_id = (Country.first(:conditions => {:name => country_name })).ison
    return all(:conditions => { :country_id => country_id, :is_active => '0' })
  end

end
