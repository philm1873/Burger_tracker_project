require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/admin.rb')
require_relative('controllers/user.rb')



get '/' do
  erb( :index )
end
