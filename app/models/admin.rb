class Admin < ActiveRecord::Base
	has_many :ads
  authenticates_with_sorcery!
end
