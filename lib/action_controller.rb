module ActionController
  class Base
    attr_accessor :request, :response

    def process(action_name)
      self.send action_name #this sends the action_name method to the Class 
    end
  end
end
