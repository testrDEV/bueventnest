# Client ID
#     923451507ae2792a6990
# Client Secret
#     32691a94487fd77beaf2c8f3978923b0931a4350

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider  :developer if Rails.env.development?
    provider  :github, '923451507ae2792a6990', '32691a94487fd77beaf2c8f3978923b0931a4350',
            { :name =>"github", :scope => ['read:user','user:email']}
    
end

