module SimpleUploader

    ## Define ModelMethods
    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      module Config
        def has_attachments(options = {})

          include SimpleUploader::Base::InstanceMethods
        end
      end
      
      module InstanceMethods
        
        
                
      end # InstanceMethods      
    end

end

::ActiveRecord::Base.send :include, SimpleUploader::Base
