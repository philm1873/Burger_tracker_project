require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/admin/burgers.rb')
require_relative('controllers/admin/deals.rb')
require_relative('controllers/admin/eateries.rb')
require_relative('controllers/user.rb')



get '/' do
  erb( :index )
end
