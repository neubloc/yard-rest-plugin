# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yard-rest-plugin}
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aisha Fenton"]
  s.date = %q{2010-11-18}
  s.description = %q{A plugin for Yardoc that produces API documentation for Restful web services. See README.markdown for more details}
  s.email = %q{aisha.fenton@visfleet.com}
  s.homepage = %q{http://github.com/visfleet/yard-rest-plugin}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A plugin for Yardoc that produces API documentation for Restful web services}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<yard>, [">= 0.6.1"])
    else
      s.add_dependency(%q<yard>, [">= 0.6.1"])
    end
  else
    s.add_dependency(%q<yard>, [">= 0.6.1"])
  end
end
