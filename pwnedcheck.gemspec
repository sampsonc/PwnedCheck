Gem::Specification.new do |s|
  s.name        = 'PwnedCheck'
  s.version     = '0.0.0'
  s.date        = '2013-12-11'
  s.summary     = "Checks your email address against haveibeenpwned.com."
  s.description = "Checks your email address against haveibeenpwned.com."
  s.authors     = ["Carl Sampson"]
  s.email       = 'chs@chs.us'
  s.files       = ["lib/pwnedcheck.rb"]
  s.homepage    = 'http://github.com/sampsonc/PwnedCheck'
  s.license       = 'MIT'
  s.add_runtime_dependency 'mechanize'
  s.add_runtime_dependency 'addressable'
end
