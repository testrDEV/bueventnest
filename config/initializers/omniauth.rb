# Client ID
#     923451507ae2792a6990
# Client Secret
#     32691a94487fd77beaf2c8f3978923b0931a4350

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider  :developer if Rails.env.development?
    provider  :github, '6220dc6bcb02379ebcf3', '0288d30c49f06be5ddf8934e5efb667ab61ce309',
            { :name =>"github", :scope => ['read:user','user:email']}
    
end

