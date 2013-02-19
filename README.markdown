# Yardoc RESTful Web Service Plugin

by VisFleet

A plugin for [Yardoc](http://yardoc.org/) that generates documentation for RESTful web services. 

## Install
    sudo gem install yard-rest-plugin

It also requires the Jeweler gem if you plan to use the rake build tasks.

## Generating Docs

When using yardoc you ask it to use the "rest" template (the -t option). For example: 

    yardoc '*.rb' -t rest --title "Our App's API"

## Writing Comments

In addition to starting your comment with the normal RDoc description. The following tags are provided:

- @url url. Specifies the URL that the service is accessed from. This tag is compulsory, only **classes** and **methods** that include this in their comments are included.

- @topic topic. Specifies the topic to categorise a **class** (not a method) under.

- @argument [type] name description. Specifies an argument that is passed to the service. You can specify as 
    many of these as required

- @example_request example. An example of the request that is send to the service

- @request_field name description. Further specifies the fields that are send within the request

- @example_response example. An example of the response that is returned from the service

- @response_field name description. Further specifies the fields that are returned within the response

## Ignored Documentation

This plugin only documents **classes** and **methods** with **@url** tags. It does not support module documentation.

The rationale here is that you are documenting external services (as represented by controllers and methods), and not internal code.

## Example:

    ##
    # Retuns all samples, as XML, for the current user that match the given parameters.
    # 
    # @url [GET] /samples.[format]?[arguments]
    # @url [GET] /samples/index.[format]?[arguments]
    # 
    # @argument [String] format Only "xml" is support at this time.
    # @argument [String] name The name of the sample
    # @argument [String] reource The resource that sample belongs to
    # @argument ["@assigned"|"@complete"|"!@complete"] search Return samples that are assigned, complete, or
    #   uncomplete.
    #
    # @example_response
    #   <samples type="array">
    #     <sample>
    #       <id>961</id>
    #       <name>My Sample</name>
    #       <state>complete</state>
    #       <last_unassigned_user_id type="integer"></last_unassigned_user_id>
    #       <resource_id type="integer">127</resource_id>
    #       <notes></notes>
    #       <updated_at type="datetime">2010-03-09T20:43:29Z</updated_at>
    #       <created_at type="datetime">2010-03-09T20:43:16Z</created_at>
    #     </sample>
    #   <samples>
    # 
    # @response_field [Integer] id A unique ID identifying the Sample
    # @response_field [String] name The name of the sample
    # @response_field [String] state The current status of the Sample. Can be complete, uncomplete, etc.
    # @response_field [String] notes Any notes given for the sample
    # @response_field [DateTime] updated_at The Date/Time (in ISO8601) that the Sample was last updated
    # @response_field [DateTime] created_at The Date/Time (in ISO8601) that the Sample was created
    # 
    def index
    end
    
    ##
    # Retuns all samples, as XML, for the current user that match the given parameters.
    # 
    # @url [POST] /samples.[format]?[arguments]
    # 
    # @argument [String] format Only "xml" is support at this time.
    #
    # @example_request
    #   <sample>
    #     <id>961</id>
    #     <name>My Sample</name>
    #     <state>complete</state>
    #     <last_unassigned_user_id type="integer"></last_unassigned_user_id>
    #     <resource_id type="integer">127</resource_id>
    #     <note_attributes type="array">
    #       <note>
    #         <id>new_123</id>
    #         <text>Note One</note>
    #       </note>
    #     </note_attributes>
    #     <updated_at type="datetime">2010-03-09T20:43:29Z</updated_at>
    #     <created_at type="datetime">2010-03-09T20:43:16Z</created_at>
    #   </sample>
    #
    # @request_field [Integer] id A unique ID identifying the Sample
    # @request_field [String] name The name of the sample
    # @request_field [String] state The current status of the Sample. Can be complete, uncomplete, etc.
    # @request_field [String] note_attributes Any notes given for the sample that will be created
    # @request_field [DateTime] updated_at The Date/Time (in ISO8601) that the Sample was last updated
    # @request_field [DateTime] created_at The Date/Time (in ISO8601) that the Sample was created
    #
    # @example_response
    #   <sample>
    #     <id>961</id>
    #     <name>My Sample</name>
    #     <state>complete</state>
    #     <last_unassigned_user_id type="integer"></last_unassigned_user_id>
    #     <resource_id type="integer">127</resource_id>
    #     <notes type="array">
    #       <note>
    #         <text>Note One</note>
    #       </note>
    #     </notes>
    #     <updated_at type="datetime">2010-03-09T20:43:29Z</updated_at>
    #     <created_at type="datetime">2010-03-09T20:43:16Z</created_at>
    #   </sample>
    # 
    # @response_field [Integer] id A unique ID identifying the Sample
    # @response_field [String] name The name of the sample
    # @response_field [String] state The current status of the Sample. Can be complete, uncomplete, etc.
    # @response_field [String] notes Any notes given for the sample
    # @response_field [DateTime] updated_at The Date/Time (in ISO8601) that the Sample was last updated
    # @response_field [DateTime] created_at The Date/Time (in ISO8601) that the Sample was created
    #
    def create
    end

## Development

You can run the template locally over the included sample code by using the following rake tasks:
    
    rake ex:clean
    rake ex:generate


