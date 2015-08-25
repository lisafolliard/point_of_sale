
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('sinatra/activerecord')
require("./lib/purchase")
require("./lib/product")
require("pg")
require('pry')

get('/') do
  erb(:index)
end

get('/purchases') do
  @purchases = Purchase.all()
  erb(:purchases)
end

post('/purchases') do
  @purchase_date = params['purchase_date']
  Purchase.create({:purchase_date => @purchase_date})
  redirect('/purchases')
end

get('/purchase/:id') do
  @purchase = Purchase.find(params['id'].to_i)
  @products = Product.all()
  @products_purchased = @purchase.products
  erb(:purchase)
end

patch('/purchase/:id/update') do
  @purchase = Purchase.find(params['id'].to_i)
  @product_ids =params['product_ids']
  @product_ids.each do |product_id|
    product=Product.find(product_id.to_i())
    product.update(:purchase_id => @purchase.id)
  end
  redirect('/purchase/' + @purchase.id().to_s())
end










get('/products') do
  @products = Product.all()
  erb(:products)
end

post('/products') do
  description = params['description']
  cost = params['cost']
  Product.create({:description => description, :cost => cost, :purchase_id => nil})
  redirect('/products')
end
