require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/burger.rb')
require_relative('../models/deal.rb')
require_relative('../models/eatery.rb')


get '/dealz' do
  @deals = Deal.find_all
  @eateries = Eatery.find_all
  erb( :"user/index")
end
