require 'pg'
require_relative('../db/sql_runner.rb')

class House
    attr_reader :id
    attr_accessor :name, :logo

    def initialize(params)
      @id = params['id'].to_i if params['id']
      @name = params['name']
      @logo = params['logo']
    end

    def save()
      sql = "INSERT INTO houses (name, logo) VALUES ('#{@name}', '#{@logo}') RETURNING id;"
      save = SqlRunner.run(sql)
      @id = save.first['id'].to_i
    end

    def find()
      sql = "SELECT * FROM houses WHERE id = #{@id}"
      find = SqlRunner.run(sql)
      result = find.first
      return result
    end

    def self.all
      sql = "SELECT * FROM houses"
      all = SqlRunner.run(sql)
      result = all.map {|house| House.new(house)}
      return result
    end

    def self.delete_all
      sql = "DELETE FROM houses"
      SqlRunner.run(sql)
    end
end