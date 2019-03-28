module ArticlesHelper

  def allow_article_edit_delete?(article)
    return false unless current_user
    article.user_id == current_user.id
  end

end
