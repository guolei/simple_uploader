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
        copy_file 'jquery.fileupload-ui.css', 'public/stylesheets/jquery.fileupload-ui.css'
	copy_file 'pbar-ani.gif', 'public/stylesheets/pbar-ani.gif'
        copy_file 'jquery.fileupload-ui.js', 'public/javascripts/jquery.fileupload-ui.js'
        copy_file 'jquery.fileupload.js', 'public/javascripts/jquery.fileupload.js'
      end
 
    end
  end
end
