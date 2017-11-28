require_relative('./eatery.rb')
require_relative('./deal.rb')
require_relative('../db/sql_runner.rb')


class Burger

  attr_reader :id, :name, :price, :type, :image, :eatery_id

  def initialize(input)
    @id = input['id'].to_i if input['id']
    @name = input['name']
    @type = input['type'].to_sym
    @price = input['price'].to_i
    @eatery_id = input['eatery_id'].to_i
    @image = input['image']
  end

  def save
    sql = "INSERT INTO burgers(name, type, price, eatery_id, image)
    VALUES($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@name, @type, @price, @eatery_id, @image]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def update
    sql = "UPDATE burgers
    SET (name, type, price, image) = ($1, $2, $3, $4)
    WHERE id = $6"
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
    sql = "SELECT * FROM eateries
    WHERE id = $1"
    values = [@eatery_id]
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

  def self.find_burgers(eatery_id)
    sql = "SELECT * FROM burgers
    WHERE eatery_id = $1"
    values = [eatery_id]
    result = SqlRunner.run(sql, values)
    return result.map { |burger| Burger.new(burger) }
  end

  def self.delete_all
    sql = "DELETE FROM burgers"
    result = SqlRunner.run(sql)
  end

end
