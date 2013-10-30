require "delegate"

module Curtains
  class Decorator < SimpleDelegator
    undef_method :==


    def initialize(base, view_context, decorator)
      super(base)
      @view_context = view_context
      @decorator = decorator
    end


    def class
      __getobj__.class
    end


    def h
      @view_context
    end


    def html_escape(*args)
      ERB::Util.html_escape(*args)
    end


    def decorated?
      true
    end


    def decorated_with
      @decorator
    end

  end
end

