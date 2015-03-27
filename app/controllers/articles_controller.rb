class ArticlesController < ApplicationController

  def index
    @articles = Article.where('delete_flg is null')

  end

  def new
      @article = Article.new
  end

  def show
      article = Article.find(params[:id])
      @title = article.title
      @text = article.text
      @comments = article.comments
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "添加成功！"
      redirect_to articles_path
    else
      render 'articles/new'
    end
  end

  def comment
    comment = Comment.create(comment_text: params[:comment_text],
                             article_id: params[:id],
                             user_id: "")
    redirect_to article_path(params[:id])
  end
  private
    def article_params
      params.require(:article).permit(:title,:text)
    end


end