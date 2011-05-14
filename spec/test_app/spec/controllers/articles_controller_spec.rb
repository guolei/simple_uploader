require 'spec_helper'

describe ArticlesController do
  render_views
  
  before do
    @article = Factory(:article)
    @attachment = Factory(:attachment, :content => @article) 
  end
 
  it "should respond to index" do
    get :show, :id => @article.id
    response.should be_success
  end
end
