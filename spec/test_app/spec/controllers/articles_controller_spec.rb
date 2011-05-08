require 'spec_helper'

describe ArticlesController do
  render_views
  
  before do
    @article = Factory(:article)
  end

  it "should respond to index" do
    get :index
    response.should be_success
  end
end
