$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_cart/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_cart"
  s.version     = SimpleCart::VERSION
  s.authors     = ["GermanFilipp"]
  s.email       = ["ger772@yandex.ru"]
  s.homepage    = "https://github.com/GermanFilipp/SimpleCart"
  s.summary     = "TODO: Summary of SimpleCart."
  s.description = "TODO: Description of SimpleCart."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.4"


  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'shoulda-matchers'
end
