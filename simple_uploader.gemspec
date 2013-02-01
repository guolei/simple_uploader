require File.expand_path('../lib/version', __FILE__)

spec = Gem::Specification.new do |s| 
  s.name = 'simple_uploader'
  s.version = SimpleUploader::VERSION 
  s.authors = ['Guo Lei', 'Wade Xing']
  s.email = ['guolei9@gmail.com', 'iamxingxing@gmail.com']
  s.homepage = 'https://github.com/xingxing/simple_uploader'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Simple Uploader'
  s.description = "One-stop upload plugin"
  s.date  = '2012-11-11'

  %w{lib app config public}.each{|folder|
    s.files += Dir['#{folder}/**/*']
  }

  s.require_path = ['lib']
  s.test_files = Dir['{spec}/**/*']

  s.add_runtime_dependency 'paperclip',  '~> 3.0'
  s.add_runtime_dependency 'builder', '>= 2.0'
end

