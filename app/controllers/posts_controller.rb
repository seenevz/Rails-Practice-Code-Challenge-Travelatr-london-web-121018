class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update]
    before_action :all_bloggers, only: [:new, :edit]
    before_action :all_destinations, only: [:new, :edit]
    

    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to post_path(@post)
        else
            render :new            
        end
    end

    def edit        
    end

    def update    
        
        if params[:like]
            @post.likes += 1 
            @post.update(likes: @post.likes)
            
            redirect_to post_path(@post)
        end
        
        if post_params
            if @post.update(post_params)
                redirect_to post_path(@post)
            else
                render :edit
            end
        end
    end

    private

    def post_params
        if params[:post]
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :Destination_id)
        end
    end

    def find_post        
        @post = Post.find(params[:id])
    end

    def all_bloggers
        @bloggers = Blogger.all
    end

    def all_destinations
        @destinations = Destination.all
    end
    
end
