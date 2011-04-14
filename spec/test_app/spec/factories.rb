Factory.define :article do |t|
  t.title "Article for test"
end

Factory.define :attachment, :class => "SimpleUploader::Attachment" do |t|
  t.attachment_file_name "file for test.doc"
  t.attachment_content_type "application/vnd.openxml"
  t.attachment_file_size 14205
  t.attachment_updated_at 1.day.ago
end