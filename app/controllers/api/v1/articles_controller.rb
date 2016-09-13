module Api;module V1
  class ArticlesController < ApplicationController

    # For showing article for given id.
    def show
      @article = Article.find_by(id: params[:id])
      if @article.present?  
        render json: @article
      else
        head 404
      end
    end    
  end
end;end
