class Category < ActiveRecord::Base
  attr_accessible :ancestry, :name, :parent_id
  has_ancestry
  
  validates_presence_of :name
end
