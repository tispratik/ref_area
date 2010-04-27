class Industry < ActiveRecord::Base
  has_many :specific_industries
  alias :specifics :specific_industries
end
