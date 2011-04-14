class CreateAttachmentTables < ActiveRecord::Migration
  def self.up
    create_table :simple_uploader_attachments, :force => true do |t|
      t.string    :content_type
      t.integer   :content_id
     	t.string    :uuid, :attachment_file_name, :attachment_content_type
      t.integer   :attachment_file_size
      t.datetime  :attachment_updated_at
      t.datetime  :created_at
      t.datetime  :updated_at
    end

    add_index :simple_uploader_attachments, [:content_type, :content_id]
    add_index :simple_uploader_attachments, :uuid, :uniq => true
  end

  def self.down
    drop_table :simple_uploader_attachments
  end
end
