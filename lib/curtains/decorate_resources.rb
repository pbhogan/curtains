module Curtains
  module DecorateResources
    extend ActiveSupport::Concern

    included do
      alias_method_chain :resource, :decoration
      alias_method_chain :build_resource, :decoration
      alias_method_chain :collection, :decoration
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

