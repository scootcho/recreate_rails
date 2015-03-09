class HomeController < ApplicationController
  before_action :header #self.before_action or HomeController.before_action

  def index
    response.write "Hi from HomeController"    
  end

  def header
    response.write "<h1>My App</h1>"
  end
end
