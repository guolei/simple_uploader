require 'spec_helper'

describe SimpleUploader::Attachment do
  before do
    @attachment = Factory(:attachment, 
      :attachment_file_name => "file for test.doc",
      :attachment_content_type => "application/vnd.openxml",
      :attachment_file_size => 14205)
  end

  it "should generate uuid" do
    @attachment.uuid.length.should == 16
  end

  it "should delegate methods" do
    @attachment.original_filename.should == "file for test.doc"
    @attachment.content_type.should == "application/vnd.openxml"
    @attachment.size.should == 14205
    @attachment.url.should_not be_blank
    @attachment.path.should_not be_blank
  end

  it "should check if image" do
    @attachment.should_not be_image
    Factory(:attachment, :attachment_content_type => "image/png").should be_image
  end
end
