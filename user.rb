require('sinatra')
require('sinatra/contrib/all')
require('date')
require_relative('models/burger.rb')
require_relative('models/deal.rb')
require_relative('models/eatery.rb')


get '/dealz' do
  today = Date.today.strftime("%A")
  @days_deals = Deal.find_day_deals(today)
  @title = "Today's Deals"
  erb( :"user/index")
end

get '/dealz/:day' do
  day = params['day'].capitalize!
  @days_deals = Deal.find_day_deals(day.to_sym)
  @title= "#{day}'s Deals"
  erb( :"user/index" )
end
