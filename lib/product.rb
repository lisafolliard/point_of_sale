class Product < ActiveRecord::Base
  belongs_to(:purchase)
  validates(:description, { :presence => true, :length => {:maximum => 50} } )
  before_save(:cost_conversion)


private

  define_method(:cost_conversion) do
    self.cost = "$".concat(cost()).concat(".00")
  end

end
