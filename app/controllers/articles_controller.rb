class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def index
      @articles = Article.all  
    end
    
    def new
        @article = Article.new
        
    end
    
    def edit

    end
    
    def show
        
    end
    
    def destroy
        @article.destroy
       redirect_to articles_path
       flash[:danger] = "Article has been deleted"
    end
    
    def create
      @article = Article.new(article_params)
      @article.user = User.first
            if @article.save
          flash[:success] = "Article was successfully created"
            #do something
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def update
        if @article.update(article_params)
            flash[:success] = "article was succesfully updated"
            redirect_to article_path(@article)
        else
            render "edit"
        end
    end
    
    def set_article
        @article = Article.find(params[:id])
    end
        def article_params
            params.require(:article).permit(:title, :description)
    end
end
