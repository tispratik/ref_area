class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :region
  
  default_scope :order => :name
end
