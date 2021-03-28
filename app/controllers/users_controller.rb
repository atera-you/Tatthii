class UsersController < ApplicationController
before_action :logged_in_user, only: [:edit, :update, :destroy,:following]
before_action :correct_user, only: [:edit, :update]
before_action :admin_user, only: :destroy

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.save
            log_in @user 
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @user
        else
            render 'new'
        end
    end

    def show
        @user=User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page],per_page: 12)
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user= User.find(params[:id])
        if @user.update(user_params)
            flash[:success]="Profile update"
            redirect_to @user
        elsif
        render 'edit'
        
        end

    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to request.referrer || current_user
    end

    def following
        @user = User.find(params[:id])
        @users = @user.following.paginate(page: params[:page])
        
    end

    def favorite 
        @user = User.find(params[:id])
        @users = @user.following
        if @users.any?
            @users.each do |user|
            @micropost=Micropost.where(user_id: user.id)
            end
            @microposts=@micropost.paginate(page: params[:page],per_page: 12)
        else
            flash[:danger]="誰もフォローしてしません"
            redirect_to root_path
        end
    end


    private
    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end



    def correct_user
        @user=User.find(params[:id])
        redirect(root_url) unless @user == current_user
    end

    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
end