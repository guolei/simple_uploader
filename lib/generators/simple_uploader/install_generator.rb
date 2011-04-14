require 'rails/generators'
require 'rails/generators/migration'

module SimpleUploader
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)
   
      def self.next_migration_number(dirname) 
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end
  
      def create_migration_file
        migration_template File.join(File.dirname(__FILE__), 'templates', 'migration.rb'),
          'db/migrate/create_attachment_tables.rb'
      end

      def copy_initializer_file
        copy_file 'initializer.rb', 'config/initializers/simple_uploader.rb'
      end
 
    end
  end
end
