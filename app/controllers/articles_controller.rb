class ArticlesController < ApplicationController

  def index
    @articles = Article.where('delete_flg is null')

  end

  def new
      @article = Article.new
      @my_name = nil
      @article_types = {'小说' => '1', '文学' => '2', '闲扯' => '3'}
      @article_type = '1'
  end

  def show
      article = Article.find(params[:id])
      @title = article.title
      @text = article.text
      @comments = article.comments
      @comment = params[:comment_text]
  end
# 1、页面上一个field，我的名字，这个field的点击提交按钮后也一并提交到后台，出现错误的时候，能够回显这个field的内容。
# 2、给article表增加一个字段，名称是type，string类型，只包含［文学、小说、闲扯］三类，新增文章页面时，可选，用select_tag做，还要能够回显
  def create
    begin
      @my_name = params[:my_name]
      @article = Article.new(article_params)
      puts params[:article_type]
      @article.save!
      # @type = {'小说' => 1, '文学' => 2, '闲扯' => 3}
      flash[:success] = "添加成功！"
      redirect_to articles_path
    rescue Exception=>e
      @article = Article.new article_params
      @my_name = params[:my_name]
      @article_types = {'小说' => '1', '文学' => '2', '闲扯' => '3'}
      @article_type = params[:article_type]
      render :new
    end

  end

  def comment
    begin
      # 1/0
    comment = Comment.create(comment_text: params[:comment_text],
                             article_id: params[:id],
                             user_id: "")
    redirect_to article_path(params[:id])
    rescue Exception=>e
      # @comment = params[:comment_text]
      # put
      redirect_to article_path(params[:id])
    end
  end
  private
    def article_params
      params.permit(:title,:text,:article_type)
    end


end