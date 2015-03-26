class ArticlesController < ApplicationController

  def index
    @articles = Article.where('delete_flg is null')

  end

  def new
      @article = Article.new
  end

  def show
      @article = Article.find(params[:id])
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

  private
    def article_params
      params.require(:article).permit(:title,:text)
    end


end