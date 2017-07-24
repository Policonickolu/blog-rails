class ArticlesController < ApplicationController

  include ArticlesHelper

  before_action :require_login, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article '#{@article.title}' Créé !"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    #@article.comments.each { |c| c.destroy }
    #@article.taggings.each { |t| t.destroy }
    @article.destroy
    flash.notice = "Article '#{@article.title}' Détruit !"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Mis à jour !"
    redirect_to article_path(@article)
  end

end
