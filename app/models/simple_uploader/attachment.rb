module SimpleUploader
  class Attachment < ActiveRecord::Base
    set_table_name :simple_uploader_attachments
    
    belongs_to :content, :polymorphic => true
    has_attached_file :attachment

    delegate :url, :original_filename, :content_type, :size, :to => :attachment, :allow_nil => true

    before_create :init_uuid
    def init_uuid
      self.uuid = ActiveSupport::SecureRandom.hex(8)
    end

    def image?
      self.content_type =~ /^image/
    end
  end
end