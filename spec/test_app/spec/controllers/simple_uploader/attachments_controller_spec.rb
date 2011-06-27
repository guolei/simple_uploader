require 'spec_helper'

describe SimpleUploader::AttachmentsController do
  before do
    @attachment = Factory(:attachment)
  end

  describe "show" do
    it "should send file" do
      
    end
  end
  
  describe "create" do
    it "should render json" do
      post :create, :attachment => {:attachment_file_name => "file.docx"}
      response.should be_success
    end
  end
end
