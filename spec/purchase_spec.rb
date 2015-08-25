require('spec_helper')

describe(Purchase) do

  describe('#products') do
    it('show which products belong to which purchase') do
      new_purchase = Purchase.create({:purchase_date => '2010-03-04 00:00:00'})
      new_product1 = Product.create({:cost => 1, :description => "shoes", :purchase_id => new_purchase.id})
      new_product2 = Product.create({:cost => 1, :description => "tie", :purchase_id => new_purchase.id})
      expect(new_purchase.products()).to(eq([new_product1, new_product2]))
    end
  end
end
