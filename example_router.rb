class Router
  def initailize
    @routes = {}
  end

  def match(route)
    @routes.update route  #merge! and update are the same hash method.
  end

  def routes(&block)
    instance_eval(&block)
    p @routes
  end
end

#your rails routes typically looks like below:

Router.new.routes do
  match '/users' => 'users#index'
  match '/login' => 'sessions#new'
end
