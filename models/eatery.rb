class Eatery

  def initialize(input)
    @id = input['id'].to_i if input['id']
    @name = input['name']
    @address = input['input']
    @tel_no = input['tel_no']
    @motto = input['motto']
    @logo = input['logo']    
  end

end
