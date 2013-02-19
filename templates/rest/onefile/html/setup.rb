include T('default/layout/html')
include YARD::Parser::Ruby::Legacy

API_CLASS_ORDER = %w(Api::V1::UsersController Api::V1::ProfilesController Api::V1::UserInterestsController
                     Api::V1::GroupsController Api::V1::ConnectionsController Api::V1::FollowsController 
                     Api::V1::CampaignsController Api::V1::PerformancesController 
                     Api::V1::AudioPerformancesController Api::V1::PhotoPerformancesController 
                     Api::V1::VideoPerformancesController Api::V1::WrittenPerformancesController
                     Api::V1::VotesController Api::V1::LikesController Api::V1::CommentsController)
                    
def init
  override_serializer  
  @object = YARD::Registry.root
  @files.shift
  @objects.delete(YARD::Registry.root)
  @objects.unshift(YARD::Registry.root)
  @objects.each do |klass|
    if API_CLASS_ORDER.index(klass.to_s)
      @objects.delete_at(@objects.index(klass))
      @objects.insert(API_CLASS_ORDER.index(klass.to_s), klass)
    end
  end
  puts "Building documentation for classes :" + @objects.join(" ") + "\n\n"
  sections :layout, [:readme, :files, :all_objects]
end

def all_objects
  @objects.compact.map {|obj| obj.format(options.merge({:template => "rest"})) }.join("\n")
end

private

def read_file(file)
  File.read(file).force_encoding(charset)
end

def parse_top_comments_from_file
  data = ""
  tokens = TokenList.new(@readme.contents)
  tokens.each do |token|
    break unless token.is_a?(RubyToken::TkCOMMENT) || token.is_a?(RubyToken::TkNL)
    data << (token.text[/\A#\s{0,1}(.*)/, 1] || "\n")
  end
  YARD::Docstring.new(@readme.contents)
end

def override_serializer
  class << @serializer
    def serialized_path(object)
      return object if object.is_a?(String)
      return 'index.html'
    end
  end
end