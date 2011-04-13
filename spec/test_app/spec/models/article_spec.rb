require 'spec_helper'

describe Article do
  before do
    @article = Factory(:article)
  end

  describe "Model methods for simple_uploader" do
    describe "has_attachments" do
      it "should repond to has_attachments" do
        Article.has_attachments
      end
    end
  end
end
