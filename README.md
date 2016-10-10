## News - Example Rails Engine with RSpec, FactoryGirl, and Capybara support

This project is a sample app for a rails engine that relies on rspec, factory\_girl,
and capybara-webkit. It is setup from the rails guide for engines. It is a mythical
news site that contains articles.

It can run both Test::Unit tests and Rspec tests. The reason to include the Test::Unit
tests is because that is how it is setup in the guide.

In building this, I referenced two blog posts that were very helpful in getting me started. Also
included the rails guide as it was used to generate the articles spec.

1. http://www.andrewhavens.com/posts/27/how-to-create-a-new-rails-engine-which-uses-rspec-and-factorygirl-for-testing/
2. https://www.viget.com/articles/rails-engine-testing-with-rspec-capybara-and-factorygirl
3. http://guides.rubyonrails.org/engines.html

# Building this from scratch

First you need to create the plugin.

```
rails plugin new [name] --mountable
```

Add these lines to the gemspec file.

```ruby
s.add_development_dependency 'rspec-rails'
s.add_development_dependency 'capybara'
s.add_development_dependency 'factory_girl_rails'
```

Add this to the gemspec file.

```rubyonrails
s.test_files = Dir["spec/**/*"]
```

Insert this at the end of the Rakefile

```ruby
Dir[File.join(File.dirname(__FILE__), 'tasks/**/*.rake')].each {|f| load f }

require 'rspec/core'
require 'rspec/core/rake_task'

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec => ['app:db:test:prepare', 'app:assets:precompile'])
```

Within the lib/[name]/engine.rb file, insert the following code after the isolate_namespace call.

```ruby
config.generators do |g|
  g.test_framework :rspec, :fixture => false
  g.fixture_replacement :factory_girl, :dir => 'spec/factories'
  g.assets false
  g.helper false
end
```

Add this to the top of the spec\_helper.rb

```ruby
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'
require 'capybara/rspec'
require 'capybara/webkit'
Capybara.current_driver = :webkit


Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
 config.mock_with :rspec
 config.use_transactional_fixtures = true
 config.infer_base_class_for_anonymous_controllers = false
 config.order = "random"
end
```

The dummy application which is in test/dummy needs to exist at that path because
it is hardcoded in the railtie gem. You can however delete the rest of the
contents of the test directory.

# Running a feature spec

In this case, I wanted to make sure that I could include a javascript library 
and use it in the within a feature spec, so I included jquery in the engine's
application.js. Then I used jquery in the a engine view to change a title.

The spec/features/article_features_spec.rb navigated to the articles index 
page, clicked the New Article link and checked for a changing title.

To make this work, you need to add jquery-rails to the gemspec's development
dependency like so:

```ruby
  s.add_development_dependency "jquery-rails"
```


