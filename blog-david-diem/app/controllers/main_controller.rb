class MainController < ApplicationController

    def index
        @blogs = Blog.all
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def new
        @blog = Blog.new
    end

    def create
        #@blog = Blog.create(
        #    title: params[:title],
        #    content: params[:content]
        #)
        @blog = Blog.create(blog_post_params)
        if @blog.valid?
            #redirect_to blogs_path
            redirect_to @blog
        else
            #redirect_to new_blog_path
            render html: "nothing personal kid..."
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
        @blog = Blog.find(params[:id])
    end

    def update
        @blog = Blog.find(params[:id])
        @blog.update(
            blog_post_params
            #title: params[:title],
            #content: params[:content]
        )
        if @blog.valid?
            #redirect_to blog_path(@blog)
            redirect_to @blog
        else
            #redirect_to blog_path
            render html: "nothing personal kid..."
        end
    end

    private
    def blog_post_params
        params.require(:blog).permit(:title, :content)
    end
end
