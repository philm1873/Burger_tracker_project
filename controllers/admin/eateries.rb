require('sinatra')
require('sinatra/contrib/all')
require_relative('../../models/burger.rb')
require_relative('../../models/deal.rb')
require_relative('../../models/eatery.rb')


get '/admin/eateries' do
  @eateries = Eatery.find_all
  erb(:"admin/eateries/index")
end

get '/admin/eateries/:id/edit' do
  @eatery = Eatery.find(params['id'])
  erb(:"admin/eateries/edit")
end

get '/admin/eateries/new' do
  erb(:"admin/eateries/new")
end

put '/admin/eateries/:id' do
  Eatery.new(params).update
  redirect '/admin/eateries'
end

delete '/admin/eateries/:id' do
  Eatery.find(params['id']).delete
  redirect '/admin/eateries'
end

post '/admin/eateries' do
   Eatery.new(params).save
   redirect '/admin/eateries'
end
