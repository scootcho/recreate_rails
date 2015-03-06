class HomeController < ApplicationController
  def index
    response.write "Hi from HomeController"    
  end
end
