$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_cart/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_cart"
  s.version     = SimpleCart::VERSION
  s.authors     = ["GermanFilipp"]
  s.email       = ["ger772@yandex.ru"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SimpleCart."
  s.description = "TODO: Description of SimpleCart."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
