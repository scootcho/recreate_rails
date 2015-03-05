class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    response.write "hi from Application"
    
    response.finish
  end 
end
