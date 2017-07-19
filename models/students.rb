require 'pg'
require_relative('../db/sql_runner')
require 'pry'

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(params)
    @id= params['id'].to_i if params['id']
    @first_name = params['first_name']
    @last_name = params['last_name']
    @house = params['house']
    @age = params['age'].to_i
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house, age) VALUES ('#{@first_name}', '#{@last_name}', '#{@house}', #{@age}) RETURNING id;"
    save = SqlRunner.run(sql)
    @id = save.first['id'].to_i
  end

  # Find by id
  def find()
    sql = "SELECT * FROM students WHERE id = #{@id};"
    # binding.pry
    result = SqlRunner.run(sql)
    return result.first
  end

  def find_house()
    sql = "SELECT houses.name FROM students INNER JOIN houses on #{@house} = houses.id WHERE students.id = #{@id} "
    find = SqlRunner.run(sql)
    return find.first['name']
  end

    #Find all students

  def self.all()
    sql = "SELECT * FROM students"
    all = SqlRunner.run(sql)
    result = all.map {|student| Student.new(student)}
    return result
  end

  #delete all strudents

  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
    
  end

end