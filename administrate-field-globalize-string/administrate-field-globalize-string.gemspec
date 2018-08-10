$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |gem|
  gem.name = "administrate-field-globalize-string"
  gem.version = "0.0.1"
  gem.authors = ["Armin Kirchner"]
  gem.email = ["armin.kirchner@gmail.com"]
  gem.homepage = "https://github.com/arkirchner/administrate-field-globalize"
  gem.summary = "Globalized string and text field plugin for Administrate"
  gem.description = gem.summary
  gem.license = "MIT"

  gem.require_paths = ["lib"]
  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.add_dependency "administrate", "0.10.0"

  gem.add_development_dependency "rspec", "~> 3.4"
end
