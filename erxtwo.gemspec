$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "erxtwo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "erxtwo"
  s.version     = Erxtwo::VERSION
  s.authors     = ["Steve Tuckner"]
  s.email       = ["stevetuckner@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Erxtwo."
  s.description = "Description of Erxtwo."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]  

  s.add_dependency "rails", "~> 4.2.7.1"
  
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  
  s.add_development_dependency "sqlite3"
end
