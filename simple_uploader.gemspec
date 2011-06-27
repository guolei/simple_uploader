spec = Gem::Specification.new do |s| 
  s.name = "simple_uploader"
  s.version = "1.0.0"
  s.author = "Guo Lei"
  s.email = "guolei9@gmail.com"
  s.homepage = "https://github.com/guolei/"
  s.platform = Gem::Platform::RUBY
  s.summary = "Simple Uploader"
  %w{lib app config public}.each{|folder|
    s.files += Dir["#{folder}/**/*"]
  }
  s.require_path = "lib"
  s.autorequire = "simple_uploader"
  s.test_files = Dir["{spec}/**/*"]
  s.add_dependency("paperclip", "~> 2.3")
  s.add_dependency("builder", ">= 2.0")
end

