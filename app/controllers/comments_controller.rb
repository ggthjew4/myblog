class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment].permit(:body))
    redirect_to article_path(@article)
  end

end
