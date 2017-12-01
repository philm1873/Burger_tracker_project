require('pry-byebug')
require_relative('../models/burger.rb')
require_relative('../models/deal.rb')
require_relative('../models/eatery.rb')


Deal.delete_all
Burger.delete_all
Eatery.delete_all

eatery1_address = '123 Lothian Road'
eatery1 = Eatery.new( {
  'name' => 'Brgrz',
  'address' => eatery1_address,
  'tel_no' => '0131 111222',
  'logo' => 'logo1.jpg'
  } )
eatery1.save

eatery2_address = '234 Morrison Street'
eatery2 = Eatery.new( {
  'name' => 'Yo Burga',
  'address' => eatery2_address,
  'tel_no' => '0131 111333',
  'logo' => 'logo2.jpg'
  } )
eatery2.save

eatery3_address = '1 Bread Street'
eatery3 = Eatery.new( {
  'name' => 'Meaty Hendersons',
  'address' => eatery3_address,
  'tel_no' => '0131 111444',
  'logo' => 'logo3.jpg'
  } )
eatery3.save

eatery4_address = '12 Leith Walk'
eatery4 = Eatery.new( {
  'name' => 'Burgers Done Lightly',
  'address' => eatery4_address,
  'tel_no' => '0131 111444',
  'logo' => 'logo4.jpg'
  } )
eatery4.save

burger1 = Burger.new ( {
  'name' => 'QP with Cheese',
  'type' => 'Cheeseburger',
  'price' => '350',
  'image' => 'image.jpg',
  'eatery_id' => eatery1.id
  } )
burger1.save

burger2 = Burger.new ( {
  'name' => 'QP with Bacon',
  'type' => 'Hamburger',
  'price' => '375',
  'image' => 'image2.jpg',
  'eatery_id' => eatery1.id
  } )
burger2.save

burger3 = Burger.new ( {
  'name' => 'Chicken Fillet',
  'type' => 'Chicken Burger',
  'price' => '360',
  'image' => 'image3.jpg',
  'eatery_id' => eatery1.id
  } )
burger3.save

burger4 = Burger.new ( {
  'name' => 'Chilli Burger',
  'type' => 'Hamburger',
  'price' => '375',
  'image' => 'image4.jpg',
  'eatery_id' => eatery1.id
  } )
burger4.save

burger5 = Burger.new ( {
  'name' => 'Bacon Cheeseburger',
  'type' => 'Cheeseburger',
  'price' => '400',
  'image' => 'image.jpg',
  'eatery_id' => eatery2.id
  } )
burger5.save

burger6 = Burger.new ( {
  'name' => 'Buffalo Burger',
  'type' => 'Hamburger',
  'price' => '425',
  'image' => 'image2.jpg',
  'eatery_id' => eatery2.id
  } )
burger6.save

burger7 = Burger.new ( {
  'name' => 'Cajun Chicken',
  'type' => 'Chicken Burger',
  'price' => '410',
  'image' => 'image3.jpg',
  'eatery_id' => eatery2.id
  } )
burger7.save

burger8 = Burger.new ( {
  'name' => 'Hawaii Burger',
  'type' => 'Hamburger',
  'price' => '450',
  'image' => 'image4.jpg',
  'eatery_id' => eatery2.id
  } )
burger8.save

burger9 = Burger.new ( {
  'name' => 'BBQ Burger',
  'type' => 'Hamburger',
  'price' => '200',
  'image' => 'image.jpg',
  'eatery_id' => eatery3.id
  } )
burger9.save

burger10 = Burger.new ( {
  'name' => 'Curry Burger',
  'type' => 'Hamburger',
  'price' => '225',
  'image' => 'image2.jpg',
  'eatery_id' => eatery3.id
  } )
burger10.save

burger11 = Burger.new ( {
  'name' => 'Slugburger',
  'type' => 'Cheeseburger',
  'price' => '250',
  'image' => 'image3.jpg',
  'eatery_id' => eatery3.id
  } )
burger11.save

burger12 = Burger.new ( {
  'name' => 'Angus Burger',
  'type' => 'Hamburger',
  'price' => '275',
  'image' => 'image4.jpg',
  'eatery_id' => eatery3.id
  } )
burger12.save

burger13 = Burger.new ( {
  'name' => 'Mushroom Burger',
  'type' => 'Veggie Burger',
  'price' => '500',
  'image' => 'image.jpg',
  'eatery_id' => eatery4.id
  } )
burger13.save

burger14 = Burger.new ( {
  'name' => 'Black Bean Burger',
  'type' => 'Veggie Burger',
  'price' => '550',
  'image' => 'image2.jpg',
  'eatery_id' => eatery4.id
  } )
burger14.save

burger15 = Burger.new ( {
  'name' => 'Tofu Burger',
  'type' => 'Veggie Burger',
  'price' => '525',
  'image' => 'image3.jpg',
  'eatery_id' => eatery4.id
  } )
burger15.save

burger16 = Burger.new ( {
  'name' => 'Falafel Burger',
  'type' => 'Veggie Burger',
  'price' => '500',
  'image' => 'image4.jpg',
  'eatery_id' => eatery4.id
  } )
burger16.save

deal1 = Deal.new( {
  'name' => '2 for 1 Cheeseburgers',
  'discount' => '1',
  'day' => 'Monday',
  'eatery_id' => eatery1.id,
  'burger_id' =>burger1.id
  } )
deal1.save

deal2 = Deal.new( {
  'name' => '2 for 1 Cheeseburgers',
  'discount' => '1',
  'day' => 'Tuesday',
  'eatery_id' => eatery2.id,
  'burger_id' =>burger5.id
  } )
deal2.save

deal3 = Deal.new( {
  'name' => '2 for 1 Cheeseburgers',
  'discount' => '1',
  'day' => 'Wednesday',
  'eatery_id' => eatery3.id,
  'burger_id' =>burger11.id
  } )
deal3.save


deal4 = Deal.new( {
  'name' => '50% off hamburgers',
  'discount' => '0.5',
  'day' => 'Thursday',
  'eatery_id' => eatery1.id,
  'burger_id' =>burger2.id
  } )
deal4.save

deal5 = Deal.new( {
  'name' => '50% off hamburgers',
  'discount' => '0.5',
  'day' => 'Friday',
  'eatery_id' => eatery2.id,
  'burger_id' =>burger6.id
  } )
deal5.save

deal6 = Deal.new( {
  'name' => '50% off hamburgers',
  'discount' => '0.5',
  'day' => 'Saturday',
  'eatery_id' => eatery3.id,
  'burger_id' =>burger9.id
  } )
deal6.save

deal7 = Deal.new( {
  'name' => '20% off Mushroom Burger',
  'discount' => '0.8',
  'day' => 'Sunday',
  'eatery_id' => eatery4.id,
  'burger_id' =>burger13.id
  } )
deal7.save

deal8 = Deal.new( {
  'name' => '3 for 1',
  'discount' => '2',
  'day' => 'Monday',
  'eatery_id' => eatery1.id,
  'burger_id' =>burger3.id
  } )
deal8.save

deal9 = Deal.new( {
  'name' => '4 for 1',
  'discount' => '3',
  'day' => 'Tuesday',
  'eatery_id' => eatery2.id,
  'burger_id' =>burger7.id
  } )
deal9.save

deal10 = Deal.new( {
  'name' => '2 for 1 Tofu Burger',
  'discount' => '1',
  'day' => 'Tuesday',
  'eatery_id' => eatery4.id,
  'burger_id' =>burger15.id
  } )
deal10.save

deal11 = Deal.new( {
  'name' => '40% off Falafel Burger',
  'discount' => '0.6',
  'day' => 'Friday',
  'eatery_id' => eatery4.id,
  'burger_id' =>burger16.id
  } )
deal11.save

deal12 = Deal.new( {
  'name' => '10% off Angus Burger',
  'discount' => '0.9',
  'day' => 'Friday',
  'eatery_id' => eatery3.id,
  'burger_id' =>burger12.id
  } )
deal12.save



binding.pry
nil
