OmniAuth.config.logger = Rails.logger 

Rails.application.config.middleware.use OmniAuth::Builder do 
		provider :facebook, 
		Rails.configuration.facebook_application_id, 
		Rails.configuration.facebook_application_secret, 
		scope: 'email', 
		:callback_path => '/auth/facebook/callback'
	end