class Deal

  def initialize(input)
    @id = input['id'].to_i if input['id']
    @name = input['name']
    @discount = input['discount'].to_f
    @day = input['day'].to_sym
    @image = input['image']
  end

end
