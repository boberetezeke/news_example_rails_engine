$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "news/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "news"
  s.version     = News::VERSION
  s.authors     = ["Steve Tuckner"]
  s.email       = ["stevetuckner@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of News."
  s.description = "Description of News."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]  

  s.add_dependency "rails", "~> 4.2.7.1"
  
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'factory_girl_rails'
  
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "jquery-rails"
end
