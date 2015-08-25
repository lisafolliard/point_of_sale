require('spec_helper')

describe(Product) do
  describe('#purchase') do
    it('determines what purchase belongs to each product') do
      new_purchase = Purchase.create({:purchase_date => '2011-09-09 00:00:00'})
      new_product = Product.create({:cost => 3, :description => 'shirt',:purchase_id => new_purchase.id})
      expect(new_product.purchase()).to(eq(new_purchase))
    end

    it('validates presence of description') do
      product = Product.new({:description => ""})
      expect(product.save()).to(eq(false))
    end

    it('validates the length of the description at most 50 characters') do
      product = Product.new({:description => 'a'.*(51)})
      expect(product.save()).to(eq(false))
    end

    it('converts cost into string') do
      product = Product.new({:cost => 4})
      expect(product.cost()).to(eq("$4.00"))
    end
  end
end
