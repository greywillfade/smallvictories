class ProfilesController < ApplicationController
  def show

  	@user = User.find_by_profile_name(params[:id])
  	if @user
  		#@statuses = @user.statuses.paginate(page: params[:page], per_page: 50)
      @statuses = @user.statuses.where('private=? OR user_id=?', false, current_user).paginate(page: params[:page], per_page: 50).order('created_at DESC')
  		#@statuses = @user.statuses.all
  		render action: :show
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end


  def dashboard
    @user = User.find(current_user)
    if @user
      @dashstatuses = @user.statuses.where('private=? OR user_id=?', false, current_user).paginate(page: params[:page], per_page: 50).order('created_at DESC')
    else
      render file: 'public/pleaseregister'
    end
  end

end
