# Needed because running outside Gem
# XXX Is there a better way to deal with this?
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require "yard-rest-plugin/base_helper"

YARD::Templates::Engine.register_template_path File.dirname(__FILE__) + '/../templates'
# TODO: Check ruby version and support ruby 1.9 in future
YARD::Parser::SourceParser.parser_type = :ruby18

# Define custom tags
YARD::Tags::Library.define_tag("URL for Service", :url)
YARD::Tags::Library.define_tag("Topic for Service", :topic)
YARD::Tags::Library.define_tag("Arguments", :argument, :with_types_and_name)
YARD::Tags::Library.define_tag("Title", :title)
YARD::Tags::Library.define_tag("Resource name", :resource_name)
YARD::Tags::Library.define_tag("Example Request", :example_request)
YARD::Tags::Library.define_tag("Require Authentication", :require_authentication)
YARD::Tags::Library.define_tag("Request Fields", :request_field, :with_types_and_name)
YARD::Tags::Library.define_tag("Example Response", :example_response)
YARD::Tags::Library.define_tag("Response Fields", :response_field, :with_name)
YARD::Tags::Library.define_tag("Headers", :header, :with_name)
YARD::Tags::Library.define_tag("Response codes", :response_code, :with_name)
YARD::Tags::Library.define_tag("Image", :image)
YARD::Tags::Library.define_tag("Overall", :overall)

