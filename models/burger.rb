class Burger

  def initialize(input)
    @id = input['id'].to_i if input['id']
    @name = input['name']
    @type = input['type'].to_sym
    @price = input['price'].to_f
    @image = input['image']
  end

end
