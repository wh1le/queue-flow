require 'rails_helper'

describe 'Profile API' do

  let(:me)           { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: me.id) }

  describe 'GET /me' do

    context 'unauthorized' do
      it 'returns 401 status if there is not access_token' do
        get '/api/v1/profiles/me', format: :json
        expect(response.status).to eq 401 
      end

      it 'returns 401 status if access_token is invalid' do
        get '/api/v1/profiles/me', format: :json, access_token: '1234'
        expect(response.status).to eq 401 
      end
    end

    context 'authorizated' do

      before { get '/api/v1/profiles/me', format: :json, access_token: access_token.token }

      it 'returns 200 status' do
        expect(response).to be_success
      end

      %w(id email created_at updated_at admin).each do |attr|
        it "contains #{attr}" do
          expect(response.body).to be_json_eql(me.send(attr.to_sym).to_json)
            .at_path(attr)
        end
      end

      %w(password password_confirmation).each do |attr|
        it "dosent contains #{attr}" do
          expect(response.body).not_to have_json_path(attr)
        end
      end
    end
  end

  describe '#GET /users' do
    context 'unauthorized' do
      it 'returns 401 status if there is not access_token' do
        get '/api/v1/profiles/users', format: :json
        expect(response.status).to eq 401 
      end

      it 'returns 401 status if access_token is invalid' do
        get '/api/v1/profiles/users', format: :json, access_token: '1234'
        expect(response.status).to eq 401 
      end
    end

    context 'authorized' do

      let!(:me)    { create(:user) } 
      let!(:users) { create_list(:user, 2) }

      before do
        get '/api/v1/profiles/users', format: :json,
          access_token: access_token.token 
      end

      it 'returns 200 status' do
        expect(response).to be_success
      end

      it "dosent contain user profile" do
        expect(response.body).not_to include_json(me.to_json)
      end
      
      it "contain users profile" do
        # expect(response.body).to include_json(users.to_json)
        byebug
        expect(response.body).to be_json_eql(users.to_json).at_path("users")
      end
    end
  end
end