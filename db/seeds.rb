require('pry-byebug')
require_relative('../models/burger.rb')
require_relative('../models/deal.rb')
require_relative('../models/eatery.rb')


Deal.delete_all
Burger.delete_all
Eatery.delete_all

eatery1_address = '123 Fake Street'
eatery1 = Eatery.new( {
  'name' => 'Krusty Burger',
  'address' => eatery1_address,
  'tel_no' => '0131 111222',
  'logo' => 'logo.jpg'
  } )
eatery1.save

burger1 = Burger.new ( {
  'name' => 'Double Cheese',
  'type' => 'Cheeseburger',
  'price' => '250',
  'image' => 'image.jpg',
  'eatery_id' => eatery1.id
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

eatery2_address = '1234 Fake Street'
eatery2 = Eatery.new( {
  'name' => 'Yo Burga',
  'address' => eatery2_address,
  'tel_no' => '0131 111333',
  'logo' => 'logo2.jpg'
  } )
eatery2.save

burger2 = Burger.new ( {
  'name' => 'Quarter Pounder',
  'type' => 'Hamburger',
  'price' => '175',
  'image' => 'image2.jpg',
  'eatery_id' => eatery2.id
  } )
burger2.save

deal2 = Deal.new( {
  'name' => '30% off hamburgers',
  'discount' => '0.7',
  'day' => 'Tuesday',
  'eatery_id' => eatery2.id,
  'burger_id' =>burger2.id
  } )
deal2.save

binding.pry
nil
