require_relative('../db/sql_runner.rb')


class Deal

  def initialize(input)
    @id = input['id'].to_i if input['id']
    @name = input['name']
    @discount = input['discount'].to_f
    @day = input['day'].to_sym
    @eatery_id = input['eatery_id']
    @burger_id = input['burger_id']
  end

  def save
    sql = "INSERT INTO deals(name, discount, day, eatery_id, burger_id)
    VALUES($1, $2 ,$3, $4, $5)
    RETURNING id"
    values = [@name, @discount, @day, @eatery_id, @burger_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def update
    sql = "UPDATE deals
    SET (name, discount, day, image) = ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@name, @discount, @day, @eatery_id, @burger_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM deals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM deals"
    SqlRunner.run(sql)
  end

  def self.find_all
    sql = "SELECT * FORM deals"
    result = SqlRunner.run(sql)
    return result.map { |deal| Deal.new(deal) }
  end

end
