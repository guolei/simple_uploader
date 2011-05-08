class ArticlesController < ApplicationController
  def index
    @article = Article.create
  end
end
