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

      # Remember to check with group and change this code to 200
      response '422', 'User created successfully' do
        # let(:user) { User.new(username: 'Miky', email: 'miky@example.com', password: 'password1', admin: true) }
        # before do
        # post '/users', params: { user: user }
        # end
        let(:user) { nil }
        let(:user_params) do
          {
            username: 'Mike Killer',
            email: 'killermike@example.com',
            password: 'password'
          }
        end

        # run_test!

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
