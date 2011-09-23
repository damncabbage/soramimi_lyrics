# -*- encoding: utf-8 -*-
require File.expand_path("lib/soramimi-lyrics/version", File.dirname(__FILE__))

Gem::Specification.new do |s|
  s.name        = "soramimi-lyrics"
  s.version     = SoramimiLyrics::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rob Howard"]
  s.email       = ["robert.john.howard@gmail.com"]
  s.homepage    = "https://github.com/damncabbage/soramimi-lyrics"
  s.summary     = "A Soramimi Karaoke lyrics parser."
  s.description = "A Soramimi Karaoke lyrics parser; extracts syllables and timecodes from a lyrics file."

  all_files       = %x{git ls-files}.split("\n").reject {|file| file =~ /gemspec/ }
  s.files         = all_files.reject {|file| file =~ /^(spec|features|cucumber|gemfiles|Appraisals)/ }
  s.test_files    = all_files.select {|file| file =~ /^(spec|features|cucumber|gemfiles|Appraisals)/ }

  s.require_path  = 'lib'

  s.add_development_dependency 'rspec'
end
