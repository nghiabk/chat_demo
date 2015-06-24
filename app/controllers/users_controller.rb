class UsersController < ApplicationController
	skip_before_action :authenticate_user!
	
  def index
    if user_signed_in?
    	@users = User.not_current_user current_user
    	@conversations = Conversation.involving(current_user).order "created_at DESC"
    end
  end
end
