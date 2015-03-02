require "connection_adapter"

class User
  @@connection = SqliteAdapter.new

  def initialze(attributes={})
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
    User.new attributes
  end
end
