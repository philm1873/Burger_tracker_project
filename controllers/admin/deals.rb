require('sinatra')
require('sinatra/contrib/all')
require_relative('../../models/burger.rb')
require_relative('../../models/deal.rb')
require_relative('../../models/eatery.rb')


get '/admin/deals' do
  @deals = Deal.find_all
  erb(:"admin/deals/index")
end

get '/admin/deals/:id/edit' do
  @eateries = Eatery.find_all
  @burgers = Burger.find_all
  @deal = Deal.find(params['id'])
  erb(:"admin/deals/edit")
end

get '/admin/deals/new' do
  @eateries = Eatery.find_all
  @burgers = Burger.find_all
  erb(:"admin/deals/new")
end

put '/admin/deals/:id' do
  Deal.new(params).update
  redirect '/admin/deals'
end

delete '/admin/deals/:id' do
  Deal.new(params).delete
  redirect '/admin/deals'
end

post '/admin/deals' do
   Deal.new(params).save
   redirect '/admin/deals'
end
