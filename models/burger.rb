require_relative('./eatery.rb')
require_relative('./deal.rb')
require_relative('../db/sql_runner.rb')


class Burger

  attr_reader :id, :name, :price, :type, :image

  def initialize(input)
    @id = input['id'].to_i if input['id']
    @name = input['name']
    @type = input['type'].to_sym
    @price = input['price'].to_i
    @image = input['image']
  end

  def save
    sql = "INSERT INTO burgers(name, type, price, image)
    VALUES($1, $2, $3, $4)
    RETURNING id"
    values = [@name, @type, @price, @image]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def update
    sql = "UPDATE burgers
    SET (name, type, price, image) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @type, @price, @image, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "Delete from burgers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_deals
    sql = "SELECT * from deals
    WHERE burger_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |deal| Deal.new(deal) }
  end

  def find_eatery
    sql = "SELECT e.* FROM burgers b
    INNER JOIN deals d
    ON b.id = d.burger_id
    INNER JOIN eateries e
    ON d.burger_id = e.id
    WHERE b.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return Eatery.new(result[0])
  end

  def display_price
    proper_price = @price/100.0
    display = sprintf('%.2f', proper_price)
    return display
  end

  def self.find_all
    sql = "SELECT * FROM burgers"
    result = SqlRunner.run(sql)
    return result.map { |burger| Burger.new(burger) }
  end

  def self.find(id)
    sql = "SELECT * FROM burgers
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Burger.new(result[0])
  end

  def self.delete_all
    sql = "DELETE FROM burgers"
    result = SqlRunner.run(sql)
  end

end
