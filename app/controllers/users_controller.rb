class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @promotions = @user.promotions.visible_to(current_user)
  end

end
