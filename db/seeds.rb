require('pry-byebug')
require_relative('../models/burger.rb')
require_relative('../models/deal.rb')
require_relative('../models/eatery.rb')


Deal.delete_all
Burger.delete_all
Eatery.delete_all

eatery1_motto = 'Lettuce show you some great burgers!!'
eatery1_address = '123 Fake Street'
eatery1 = Eatery.new( {
  'name' => 'Krusty Burger',
  'address' => eatery1_address,
  'tel_no' => '0131 111222',
  'motto' => eatery1_motto,
  'logo' => 'logo.jpg'
  } )
eatery1.save

burger1 = Burger.new ( {
  'name' => 'Double Cheese',
  'type' => 'Cheeseburger',
  'price' => '2.50',
  'image' => 'image.jpg'
  } )
burger1.save

deal1 = Deal.new( {
  'name' => 'I got these cheeseburgers...',
  'discount' => '1',
  'day' => 'Tuesday',
  'eatery_id' => eatery1.id,
  'burger_id' =>burger1.id
  } )
deal1.save

binding.pry
nil
