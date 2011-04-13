class CreateAttachmentTables < ActiveRecord::Migration
  def self.up
    create_table :attachments, :force => true do |t|
      t.string    :content_type
      t.integer   :content_id
      t.datetime  :created_at
      t.datetime  :updated_at
    end

    add_index :attachments, [:content_type, :content_id]
  end

  def self.down
    drop_table :attachments
  end
end
