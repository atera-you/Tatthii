class MicropostsController < ApplicationController
  before_action :logged_in_user, only:[:new,:create,:destroy]
  before_action :correct_user, only: :destroy
  def new
      @micropost = current_user.microposts.build
  end
  
  def index
    if params[:tag_name]
      @index = ("#{params[:tag_name]}の検索結果")
      @microposts = Micropost.tagged_with(params[:tag_name]).paginate(page: params[:page])
    else
      @index = ""
      @microposts = Micropost.paginate(page: params[:page],per_page: 12)
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
    @micropost.destroy
    flash[:success]="Sharing cancel"
    redirect_to request.referrer || root_url
  end

  def finder
    
  end



  private
  def micropost_params
    params.require(:micropost).permit(:content, :tag_list,:tag_name)
  end



  def correct_user
    @micropost=current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end

end
