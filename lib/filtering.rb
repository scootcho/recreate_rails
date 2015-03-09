module Filtering
  def self.included(base) #base == ActionController::Base
    base.extend ClassMethods
  end

  module ClassMethods
    def before_action(method)
      before_actions << method
    end

    def before_actions
      @before_actions ||= []  #to gather all the before actions in an array for processing
    end

    def after_action(method)
      after_actions << method
    end

    def after_actions
      @after_actions ||= []  #to gather all the before actions in an array for processing
    end
  end

  def process(action_name) #the process method corresponds to the one in ActionController.
    self.class.before_actions.each { |method| send method }
    super #this calls the ActionController::Base.process
    self.class.after_actions.each { |method| send method }
  end
end
