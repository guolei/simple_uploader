require 'spec_helper'

describe Article do
  before do
    @article = Factory(:article)
  end

  describe "Model methods for simple_uploader" do
    describe "one-to-many relationship" do
      before do
        @attachment = Factory(:attachment, :content => @article)
      end

      it "should has many attachments" do
        Article.has_attachments
        @article.attachments.should == [@attachment]
      end

      it "should has one attachment if unique => true" do
        Article.has_attachment
        @article.attachment.should == @attachment
      end
    end
  end
end
