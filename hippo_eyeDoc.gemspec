# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hippo_eyeDoc/version"

Gem::Specification.new do |s|
  s.name        = "hippo_eyeDoc"
  s.version     = Hippo_eyeDoc::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Losh", "Robert Jackson", 'Jon Jackson']
  s.email       = ["od2010@sbcglobal.net", "robertj@promedicalinc.com"]
  s.homepage    = "https://github.com/DrBassman/hippo_eyeDoc"
  s.summary     = %q{HIPAA Transaction Set Generator/Parser}
  s.description = %q{HIPAA Transaction Set Generator/Parser}
  s.license     = 'BSD 2-Clause'

#  s.rubyforge_project = "hippo"

  s.add_development_dependency('minitest')
  s.add_development_dependency('rake', '~>10.0.2')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
