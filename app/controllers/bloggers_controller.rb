class BloggersController < ApplicationController
    before_action :find_blogger, only: [:show, :edit, :update]
    
    def index
        @bloggers = Blogger.all
    end

    def show
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)

        if @blogger.save
            redirect_to blogger_path(@blogger)
        else
            errors
            render :new            
        end
    end

    def edit        
    end

    def update
        if @blogger.update(blogger_params)
            redirect_to blogger_path(@blogger)
        else
            errors
            render :edit
        end
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

    def find_blogger
        @blogger = Blogger.find(params[:id])
    end

    def errors        
        flash[:errors] = @blogger.errors.full_messages
    end
    
end
