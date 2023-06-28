require 'swagger_helper'

RSpec.describe 'Users::Sessions', type: :request do
  path '/users/sign_in' do
    post 'User sign in' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: 'user@example.com' },
          password: { type: :string, example: 'password' }
        },
        required: %w[email password]
      }

      response '200', 'Signed in successfully' do
        schema type: :object,
               properties: {
                 status: {
                   type: :object,
                   properties: {
                     code: { type: :integer, example: 200 },
                     message: { type: :string, example: 'Signed in successfully!' },
                     data: {
                       type: :object,
                       properties: {
                         id: { type: :integer },
                         username: { type: :string },
                         email: { type: :string },
                         admin: { type: :boolean },
                         created_at: { type: :string, format: 'date-time' },
                         updated_at: { type: :string, format: 'date-time' },
                         jti: { type: :string }
                       },
                       required: %w[id username email admin]
                     }
                   },
                   required: %w[code message data]
                 }
               },
               required: ['status']

        let(:user) { User.create!(username: 'Phill', email: 'phill@example.com', password: 'password', admin: true) }

        before do
          sign_in user
        end
        run_test!
      end
    end
  end

  # TODO: please fix signout spec

  path '/users/sign_out' do
    delete 'User sign out' do
      tags 'Users'
      produces 'application/json'
      parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer token', required: true

      # COME BACK  TO THIS LATER ..................................................................................
      # response '200', 'Signed out successfully' do
      #   schema type: :object,
      #          properties: {
      #            status: {
      #              type: :integer,
      #              example: 200
      #            },
      #            message: {
      #              type: :string,
      #              example: 'Signed out successfully!'
      #            }
      #          },
      #          required: ['status', 'message']

      #   let(:user) { User.create!(username: 'Mike', email: 'mike@example.com', password: 'password', admin: true) }

      #   before do
      #     sign_in user
      #   end

      #   let(:Authorization) { "Bearer #{JWT.encode({ sub: user.id },
      #   Rails.application.credentials.fetch(:secret_key_base))}" }

      #   run_test!

      # end
    end
  end
end
