
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
