module Curtains
  module DecorateResources
    extend ActiveSupport::Concern

    included do
      # alias_method_chain :resource, :decoration
      alias_method :resource_without_decoration, :resource
      alias_method :resource, :resource_with_decoration

      # alias_method_chain :build_resource, :decoration
      alias_method :build_resource_without_decoration, :build_resource
      alias_method :build_resource, :build_resource_with_decoration

      # alias_method_chain :collection, :decoration
      alias_method :collection_without_decoration, :collection
      alias_method :collection, :collection_with_decoration
    end


    def resource_with_decoration
      decorate(resource_without_decoration)
    end


    def build_resource_with_decoration
      decorate(build_resource_without_decoration)
    end


    def collection_with_decoration
      decorate(collection_without_decoration)
    end

  end
end

