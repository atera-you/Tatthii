class MicropostsController < ApplicationController
    before_action :logged_in_user, only:[:new,:create,:destroy]

    def new
        @micropost = current_user.microposts.build
    end
    
    def index
        if params[:tag_name]
            @microposts = Micropost.tagged_with(params[:tag_name]).paginate(page: params[:page])
        else
            @microposts = Micropost.paginate(page: params[:page],per_page: 5)
        end
    end

    def create
        @micropost=current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success]="Sharing success"
            redirect_to current_user
        else
            render 'new'
        end
    end

    def destroy

    end

    private
    def micropost_params
        params.require(:micropost).permit(:content, :tag_list,:tag_name)
    end
end
