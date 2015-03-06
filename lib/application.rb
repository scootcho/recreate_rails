require "action_controller"
require "application_controller"

class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controler_name, action_name = route(request.path_info)
    # ["home", "index"]
    
    # "home" => HomeController
    response.finish
  end 

  def route(path)
    # => "home/index" => ["", "home", "index"]
    _, controller_name, action_name = path.split("/") 
    [controller_name || "home", action_name || "index" ]
  end

  def load_controller_class(name)
    # name = "home" => HomeController
    require "#{name}_controller" # require "home_controller"
    Object.const_get name.capitalize + "Controller" # "HomeController" 
  end
end
