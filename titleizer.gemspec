Gem::Specification.new do |s|
  s.name     = "titleizer"
  s.version  = "1.0.2"
  s.date     = "2009-02-02"
  s.summary  = "Smart capitalisation of titles"
  s.email    = "haruki.zaemon@gmail.com"
  s.homepage = "http://github.com/harukizaemon/titleizer"
  s.description = "Adds String#titleize and String#titlecase! to perform smart capitalisation of titles"
  s.has_rdoc = true
  s.authors  = ["Simon Harris"]
  s.files    = ["CHANGELOG.rdoc",
                "Rakefile",
                "README.rdoc",
                "titleizer.gemspec",
                "lib/titleizer.rb",
                "spec/haruki_zaemon/titleizer/string_spec.rb"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.rdoc"]
end
