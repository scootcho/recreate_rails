require "connection_adapter"

module ActiveRecord
  class Base
    @@connection = SqliteAdapter.new

    def initialize(attributes={})
      @attributes = attributes
    end

    def id
      @attributes[:id]
    end

    def name
      @attributes[:name]
    end

    def self.find(id)
      attributes = @@connection.execute("SELECT * FROM users WHERE id = #{id.to_i} LIMIT 1").first
      new attributes
    end
  end
end
