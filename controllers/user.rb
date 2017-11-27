require('sinatra')
require('sinatra/contrib/all')
require('date')
require_relative('models/burger.rb')
require_relative('models/deal.rb')
require_relative('models/eatery.rb')


get '/dealz' do
  @today = Date.today.strftime("%A")
  @days_deals = Deal.find_day_deals(today)
  erb( :"user/index")
end

get '/dealz/:day' do
  @today = Date.today.strftime("%A")
  @days_deals = Deal.find_day_deals(params['day'].to_sym)
  erb( :"user/index" )
end
