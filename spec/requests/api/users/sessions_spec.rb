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
        required: ['email', 'password']
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
                       required: ['id', 'username', 'email', 'admin']
                     }
                   },
                   required: ['code', 'message', 'data']
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

  # path '/users/sign_out' do
  #   delete 'User sign out' do
  #     tags 'Users'
  #     produces 'application/json'
  #     parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer token', required: true

  #     response '200', 'Signed out successfully' do
  #       schema type: :object,
  #              properties: {
  #                status: {
  #                  type: :integer,
  #                  example: 200
  #                },
  #                message: {
  #                  type: :string,
  #                  example: 'Signed out successfully!'
  #                }
  #              },
  #              required: ['status', 'message']

               
  #              # before do
  #       #   token_payload = { sub: user.id, jti: SecureRandom.uuid } # Include the jti in the JWT payload
  #       #   user.jti = JWT.encode(token_payload, Rails.application.credentials.fetch(:secret_key_base))
  #       #   sign_in user
  #       #   # user.jti = token
  #       # end

  #       # before do
  #       #   let(:user) { User.new(username: 'Mike', email: 'mike@example.com', password: 'password', admin: true) }
  #       #   token_payload = { sub: user.id, jti: SecureRandom.uuid }
  #       #   user.jti = JWT.encode(token_payload, Rails.application.credentials.fetch(:secret_key_base))
  #       #   user.save!
  #       #   sign_in user
  #       # end
        
  #       # gentoken = JWT.encode({ sub: user.id }, Rails.application.credentials.fetch(:secret_key_base))

  #       # let(:Authorization) { "Bearer #{gentoken}" }

        
  #     before do
  #       let(:user) { User.create!(username: 'Mike', email: 'mike@example.com', password: 'password', admin: true) }
  #       token_payload = { sub: user.id, jti: SecureRandom.uuid }
  #       user.update(jti: JWT.encode(token_payload, Rails.application.credentials.fetch(:secret_key_base)))
  #       sign_in user
  #     end

  #     let(:Authorization) { "Bearer #{user.jti}" }
        

  #       run_test! do |response|
  #         sign_out user
  #         puts '............................................'
  #         puts response
  #       end

  #     end
  #   end
  # end


  # TODO please fix signout spec
  path '/users/sign_out' do
    delete 'User sign out' do
      tags 'Users'
      produces 'application/json'
      parameter name: 'Authorization', in: :header, type: :string, description: 'Bearer token', required: true
  
      response '200', 'Signed out successfully' do
        schema type: :object,
               properties: {
                 status: {
                   type: :integer,
                   example: 200
                 },
                 message: {
                   type: :string,
                   example: 'Signed out successfully!'
                 }
               },
               required: ['status', 'message']
  
               let(:user) { User.create!(username: 'Mark', email: 'mark@example.com', password: 'password', admin: true) }
        before do
          token_payload = { sub: user.id, jti: SecureRandom.uuid }
          user.update(jti: JWT.encode(token_payload, Rails.application.credentials.fetch(:secret_key_base)))
          sign_in user
        end
  
        let(:Authorization) { "Bearer #{user.jti}" }
  
        run_test! do |_response|
          sign_out user
        end
      end
    end
  end
  
end

