require 'pp'

module YARD::Templates::Helpers
  module BaseHelper

    # Adds additional test that only includes Objects that contain a URL tag
    def run_verifier(list)

      if options[:verifier]
        list.reject! { |item| options[:verifier].call(item).is_a?(FalseClass) }
      end

      index_objects(list)
    end

    def index_objects(list)
      res = reject_module(list)
      res = reject_without_url(res)
      #res = reject_without_topic(res)
      res = reject_overall(res)

      res
    end

    def reject_module(list)
      list.reject { |object| [:root, :module].include?(object.type) }
    end

    def reject_without_url(list)
      list.reject { |object| [:class, :method].include?(object.type) and object.tags("url").empty? }
    end

    def reject_without_topic(list)
      list.reject { |object| [:class].include?(object.type) and object.tags("topic").empty? }
    end

    def reject_overall(list)
      list.reject { |object| object.has_tag?('overall') }
    end
    
    def format_object_title(object)
      case object
      when YARD::CodeObjects::RootObject
        ""
      else
        format_object_type(object) + ": " + object.path
      end
    end
    
    def required_field(tag)
      tag.types && tag.types.first == "required" ? '<span class="require">*</span>' : ""
    end
    
    
  end
end