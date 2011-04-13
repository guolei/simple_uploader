require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
require 'base'

module SimpleUploader
  mattr_accessor :file_path
  @@file_path = "/default"

  def self.setup
    yield self
  end
end

