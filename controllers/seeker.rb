require('sinatra')
require('sinatra/contrib/all')
require('date')
require_relative('../models/burger.rb')
require_relative('../models/deal.rb')
require_relative('../models/eatery.rb')


get '/seeker' do
  @days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  today = Date.today.strftime("%A")
  @days_deals = Deal.find_day_deals(today)
  @title = "Today's Deals"
  erb( :"user/index")
end

get '/seeker/eateries' do
  @eateries = Eatery.find_all
  erb( :"user/eateries/index" )
end

get '/seeker/eateries/:id' do
  @eatery = Eatery.find(params['id'])
  erb( :"user/eateries/show" )
end

get '/seeker/deals' do
  @deals = Deal.find_all
  erb( :"user/deals/index" )
end

get '/seeker/deals/:id' do
  @deal = Deal.find(params['id'])
  erb( :"user/deals/show" )
end

get '/seeker/:day' do
  day = params['day'].capitalize!
  @days_deals = Deal.find_day_deals(day.to_sym)
  @title = "#{day}'s Deals"
  erb( :"user/index" )
end

get '/seeker/burgers/eatery/:id' do
  @burgers = Burger.find_burgers(params['id'])
  erb( :"user/burgers/index" )
end

get '/seeker/burgers/:id' do
  @burger = Burger.find(params['id'])
  erb( :"user/burgers/show" )
end
