class ApplicationController < ActionController::Base
	protect_from_forgery

	private

	def current_user
	  @current_user = true
	  # @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def user_logged?
    not current_user.nil?
  end


	helper_method :current_user, :user_logged?
end
