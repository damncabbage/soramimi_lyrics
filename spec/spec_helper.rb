require 'rspec'
require 'rspec/autorun'
require 'soramimi_lyrics'

PROJECT_ROOT = File.expand_path('..', File.dirname(__FILE__)).freeze
$LOAD_PATH << File.join(PROJECT_ROOT, 'lib')
Dir[File.join(PROJECT_ROOT, 'spec', 'support', '**', '*.rb')].each { |file| require(file) }

RSpec.configure do |config|
  #config.include SoramimiLyrics
end
