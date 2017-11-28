require('sinatra')
require('sinatra/contrib/all')
require('date')
require_relative('../models/burger.rb')
require_relative('../models/deal.rb')
require_relative('../models/eatery.rb')


get '/dealz' do
  today = Date.today.strftime("%A")
  @days_deals = Deal.find_day_deals(today)
  @title = "Today's Deals"
  erb( :"user/index")
end

get '/dealz/eateries' do
  @eateries = Eatery.find_all
  erb( :"user/eateries/index" )
end

get '/dealz/eateries/:id' do
  @eatery = Eatery.find(params['id'])
  erb( :"user/eateries/show" )
end

get '/dealz/deals' do
  @deals = Deal.find_all
  erb( :"user/deals/index" )
end

get '/dealz/deals/:id' do
  @deal = Deal.find(params['id'])
  erb( :"user/deals/show" )
end

get '/dealz/:day' do
  day = params['day'].capitalize!
  @days_deals = Deal.find_day_deals(day.to_sym)
  @title = "#{day}'s Deals"
  erb( :"user/index" )
end

get '/dealz/burgers/:id' do
  @burgers = Eatery.find_burgers(params['id'])
  erb( :"user/burgers/index" )
end

get '/dealz/burger/:id' do
  @burger = Burger.find(params['id'])
  erb( :"user/burgers/show" )
end
