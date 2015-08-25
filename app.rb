
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
