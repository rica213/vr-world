require 'swagger_helper'

RSpec.describe 'User API', type: :request do
  path '/users' do
    post 'Creates a new user' do
      tags 'User Registrations'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[username email password]
      }


      response '422', 'User created successfully' do
        let(:user) { nil }
        let(:user_params) do
          {
            username: 'Mike Killer',
            email: 'killermike@example.com',
            password: 'password'
          }
        end

        run_test! do
          post '/users', params: { user: user_params }
        end
      end

      response '422', 'User creation failed' do
        let(:user) { { username: '', email: 'john@example.com', password: 'password' } }
        run_test!
      end
    end
  end
end
