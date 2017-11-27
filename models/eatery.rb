require_relative('./burger.rb')
require_relative('./deal.rb')
require_relative('../db/sql_runner.rb')

class Eatery

  attr_reader :id, :logo, :name

  def initialize(input)
    @id = input['id'].to_i if input['id']
    @name = input['name']
    @address = input['address']
    @tel_no = input['tel_no']
    @logo = input['logo']
  end

  def save
    sql = "INSERT INTO eateries(name, address, tel_no, logo)
    VALUES($1, $2, $3, $4)
    RETURNING id"
    values = [@name, @address, @tel_no, @logo]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def update
    sql = "UPDATE eateries
    SET (name, address, tel_no, motto, logo) = ($1, $2, $3, $4)
    WHERE id = $6"
    values = [@name, @address, @tel_no, @logo, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM eateries
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_burgers
    sql = "SELECT *.b FROM deals d
    INNER JOIN burgers b
    ON d.burger_id = b.id
    WHERE d.eatery_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |burger| Burger.new(burger) }
  end

  def find_deals
    sql = "SELECT * FROM deals
    WHERE eatery_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |deal| Deal.new(deal) }
  end

  def self.find(id)
    sql = "SELECT * FROM eateries
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Eatery.new(result[0])
  end

  def self.find_all
    sql = "SELECT * FROM eateries"
    result = SqlRunner.run(sql)
    return result.map { |eatery| Eatery.new(eatery) }
  end

  def self.delete_all
    sql = "Delete from eateries"
    SqlRunner.run(sql)
  end


end
