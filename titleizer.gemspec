Gem::Specification.new do |s|
  s.name     = "titleizer"
  s.version  = "1.0.0"
  s.date     = "2009-02-01"
  s.summary  = "Smart capitalisation of titles"
  s.email    = "haruki.zaemon@gmail.com"
  s.homepage = "http://github.com/harukizaemon/titleizer"
  s.description = "Adds String#titleize and String#titlecase! to perform smart capitalisation of titles"
  s.has_rdoc = true
  s.authors  = ["Simon Harris"]
  s.files    = ["CHANGELOG.rdoc",
                "MIT-LICENSE",
                "README.rdoc",
                "titleizer.gemspec",
                "lib/titleizer.rb",
                "lib/haruki_zaemon/titleizer/string.rb"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.rdoc"]
end
