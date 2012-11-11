module SimpleUploader
  class Attachment < ActiveRecord::Base
    set_table_name :simple_uploader_attachments
    
    belongs_to :content, :polymorphic => true
    
    has_attached_file :attachment, :styles => lambda { |attachment| attachment.instance.styles }

    delegate :path, :original_filename, :content_type, :size, :to => :attachment, :allow_nil => true
    alias_method :name, :original_filename

    before_create :init_uuid
    def init_uuid
      self.uuid = ActiveSupport::SecureRandom.hex(8)
    end

    def url
      "/file/#{self.uuid}"
    end

    def image?
      self.content_type =~ /^image/
    end

    def styles
      self.image? ? self[:content_type].constantize._attchments_options[:styles] : {}
    rescue Exception => ex
      {}
    end
  end
end
