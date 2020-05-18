require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  
  # omniauth_hash = { 'provider' => 'github',
  #                 'uid' => '12345',
  #                 'info' => {
  #                     'name' => 'Devansh Das',
  #                     'email' =>"ddas1@binghamton.edu",
  #                 }
  # }
  
  before do 
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github] 
  end 
   
  describe "#create" do
    context "no active session" do 
      before do
        session[:user_id] = nil
      end
      it "checks that there is no active session " do 
        expect(controller).to receive (:session?).and_return(false)
        post :create, provider: :github 
      end
      
      context "authorization does not exist" do 
        it "checks that authorization does not exist" do
          allow(controller).to receive(:session?).and_return(false)
          expect(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(false)
          post :create, provider: :github
        end
        context "user does not exist" do
          allow(controller).to receive(:session?).and_return(false)
          allow(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(false)
          expect(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(false)
          post :create, provider: :github
        end
        context "user registers with given provider"do 
          let(:userid) {'1'}
          let(:user) {instance_double('User', name: 'Devansh Das', email: 'ddas1@binghamton.edu')}
          let(:auth) {instance_double('Authorization', provider: 'github', uid: '12345')}

          it "creates user record using authhash" do
            allow(controller).to receive(:session?).and_return(false)
            allow(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(false)
            allow(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(false)
            expect(User).to receive(:create_with_omniauth).with(OmniAuth.config.mock_auth[:github]['info']).and_return(user)
            post :create, provider: :github
          end
          
          it "creates authorization that belongs to user" do
            allow(controller).to receive(:session?).and_return(false)
            allow(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]).and_return(false)
            allow(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(false)
            allow(User).to receive(:create_with_omniauth).with(OmniAuth.config.mock_auth[:github]['info']).and_return(user)
            expect(Authorization).to receive(:create_with_omniauth).with(OmniAuth.config.mock_auth[:github]).and_return(auth)
            post :create, provider: :github            
          end
        end
      end
    end
  end
end

      
