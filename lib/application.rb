require "action_controller"
require "application_controller"
require "active_record"
require "router"
require "config/routes"

#Example of const_missing
#
#class Object
#  def const_missing(name)
#    name # :User => "user"
#    require name.to_s.downcase    #this will require "user" to make sure user.rb is loaded as database
#  end
#end

class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info) # /home/index
    # ["home", "index"]
    
    controller_class = load_controller_class(controller_name) #controller_name = "home" => #HomeController
    controller = controller_class.new #initializes HomeController and pass the logics there.
    controller.request = request
    controller.response = response
    controller.process action_name # calls: controller.index
    
    # "home" => HomeController
    response.finish
  end 

  def route(path) # request.path_info is passed in as path
    # => "home/index" => ["", "home", "index"]
    #_, controller_name, action_name = path.split("/") 
    #[controller_name || "home", action_name || "index" ]
    Routes.recognize(path)
  end

  def load_controller_class(name)
    # name = "home" => HomeController
    require "#{name}_controller" # require "home_controller"
    Object.const_get name.capitalize + "Controller" # "HomeController" 
  end
end
