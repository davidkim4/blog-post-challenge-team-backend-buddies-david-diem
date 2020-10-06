class MainController < ApplicationController

    def index
        @blogs = Blog.all
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def new
    end

    def create
        @blog = Blog.create(
            title: params[:title],
            content: params[:content]
        )
        if @blog.valid?
            redirect_to blogs_path
        else
            redirect_to new_blog_path
        end
    end

    def destroy
        @blog = Blog.find(params[:id])
        if @blog.destroy
            redirect_to blogs_path
        else
            redirect_to blog_path(@blog)
        end
    end

    def edit
    end

    def update
        @blog = Blog.find(params[:id])
        @blog.update(
            title: params[:title],
            content: params[:content]
        )
        if @blog.valid?
            redirect_to blog_path(@blog)
        else
            redirect_to blog_path
        end
    end
end
