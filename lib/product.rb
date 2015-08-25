class Product < ActiveRecord::Base
  belongs_to(:purchase)
  validates(:description, :presence => true)
end
