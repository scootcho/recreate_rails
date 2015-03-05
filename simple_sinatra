#Implement a simple subset of Sinatra as a Rack app
#
#just enough to run this:
#
#get "/hi" do
#  "Owning!"
#end


Routes = {
  "GET" => {
    # "path" => block   #nested
  }
}

def get(path , &block)      #the get method that will parse the 
  Routes["GET"][path] = block   #we're assigning block to path
end

get "/" do
  "awesome!"
end

run -> env do
  method = env["REQUEST_METHOD"]
  path = env["PATH_INFO"]

  if block = Routes[method][path]
    body = block.call
    [200, {}, [body]]
  else
    [404, {}, ["Not found"]]
  end 
end
