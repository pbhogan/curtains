require "rails/engine"


module Curtains
  autoload :Decorator, "curtains/decorator"
  autoload :DecorateResources, "curtains/decorate_resources"
  autoload :VERSION, "curtains/version"
end


class ActionController::Base

  helper_method :decorate
  def decorate(model)
    if model.respond_to? :each
      decorated = model.map { |m| decorate(m) }
      yield(decorated) if block_given?
      decorated
    else
      decorator = "#{model.class}Decorator".constantize
      decorated = decorator.new(model, view_context, decorator)
      yield(decorated) if block_given?
      decorated
    end
  end


  def self.decorate_resources
    self.class_eval do
      include Curtains::DecorateResources
    end
  end

end

