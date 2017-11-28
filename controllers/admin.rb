require('sinatra')
require('sinatra/contrib/all')
require('date')
require_relative('../models/burger.rb')
require_relative('../models/deal.rb')
require_relative('../models/eatery.rb')

get '/admin' do
  erb(:"admin/index")
end

get '/admin/burgers' do
  @burgers = Burger.find_all
  erb(:"admin/burgers/index")
end

get '/admin/burgers/:id/edit' do
  @burger = Burger.find(params['id'])
  erb(:"admin/burgers/edit")
end

get '/admin/burgers/new' do
  erb(:"admin/burgers/new")
end

put '/admin/burgers/:id' do
  Burger.new(params).update
  redirect '/admin/burgers'
end

delete '/admin/burgers/:id' do
  Burger.new(params).delete
  redirect '/admin/burgers'
end

post '/admin/burgers' do
   Burger.new(params).save
   redirect '/admin/burgers'
end
