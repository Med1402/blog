module Api
  module V1
    class ArticlesController < BaseController
        
      def index
        render json: Article.all
      end

      def show
        render json: Article.find(params[:id])
      end

      def create
        @article = Article.new(article_params)
        if @article.save
            render json: @article.reload, status: 201
        else
          render json: {errors: @article.errors }, status: 400
        end  
      end

      def update
        @article = Article.find(params[:id])
        if @article
          @article.update(article_params)
          render json: 'Article updated successfully', status: 200
        else
          render error: 'unable to create article' , status: 400
        end
      end

      def destroy
        @article = Article.find(params[:id])
        @article.destroy
          render json: "Article deleted succesfully"
      end

      private

      def article_params
        params.require(:article).permit(:title, :body, :status, :user_id)
      end
    end
  end
end