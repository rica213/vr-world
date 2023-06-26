require 'swagger_helper'

RSpec.describe 'Api::V1::StudiosController', type: :request do
  path '/api/v1/studios' do
    get 'Retrieve all studios' do
      tags 'Studios'
      produces 'application/json'

      response '200', 'Studios retrieved successfully' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :string },
                   price: { type: :number },
                   duration: { type: :integer },
                   location: { type: :string },
                   working_hours: { type: :string },
                   image_url: { type: :string },
                   contact: { type: :string },
                   created_at: { type: :string },
                   updated_at: { type: :string },
                 },
                 required: ['id', 'name', 'description', 'price', 'duration', 'location', 'working_hours', 'image_url', 'contact', 'created_at', 'updated_at']
               }

        run_test!
      end
    end

    post 'Create a studio' do
      tags 'Studios'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :studio, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'Studio 1' },
          description: { type: :string, example: 'Description 1' },
          price: { type: :number, example: 10.0 },
          duration: { type: :integer, example: 60 },
          location: { type: :string, example: 'Location 1' },
          working_hours: { type: :string, example: '9am-6pm' },
          image_url: { type: :string, example: 'image1.jpg' },
          contact: { type: :string, example: 'Contact 1' },
          rating: {type: :integer,example: 1},
          user_id: {type: :integer,example: 400},
          created_at: { type: :string },
          updated_at: { type: :string }
        },
        required: ['name', 'description', 'price', 'duration', 'location', 'working_hours', 'image_url', 'contact']
      }

      response '201', 'Studio created successfully' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 price: { type: :decimal },
                 duration: { type: :integer },
                 location: { type: :string },
                 working_hours: { type: :string },
                 image_url: { type: :string },
                 contact: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               },
               required: ['id', 'name', 'description', 'price', 'duration', 'location', 'working_hours', 'image_url', 'contact', 'created_at', 'updated_at']

               let(:user) { User.create!(username: 'Mike', email: 'mike@example.com', password: 'password', admin: true) }
               let(:studio) { { name: 'Studio 1', description: 'Description 1', price: 100, duration: 60, location: 'Location 1', working_hours: '9am-6pm', image_url: 'image1.jpg', contact: 'Contact 1' } }

        before do


          sign_in user
        end

        run_test!
      end

      response '401', 'Unauthorized - User is not authorized to create a studio' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']

        let(:user) { User.create!(username: 'James', email: 'james@example.com', password: 'password123', admin: false) }
        let(:studio) { { name: 'Studio 1', description: 'Description 1', price: 10.0, duration: 60, location: 'Location 1', working_hours: '9am-6pm', image_url: 'image1.jpg', contact: 'Contact 1' } }

        before do
          sign_in user
        end

        run_test!
      end
    end
  end

  path '/api/v1/studios/{id}' do
    get 'Retrieve a specific studio' do
      tags 'Studios'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Studio retrieved successfully' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 price: { type: :decimal },
                 duration: { type: :integer },
                 location: { type: :string },
                 working_hours: { type: :string },
                 image_url: { type: :string },
                 contact: { type: :string },
                 rating: {type: :integer,example: 1},
                 user_id: {type: :integer,example: 400},
                 created_at: { type: :string },
                 updated_at: { type: :string }
               },
               required: ['id', 'name', 'description', 'price', 'duration', 'location', 'working_hours', 'image_url', 'contact', 'created_at', 'updated_at']
               
            let(:user) { User.create!(username: 'Mike', email: 'mike@example.com', password: 'password', admin: true) }

            let(:studio) { Studio.create!(name: 'Studio 1', description: 'Description 1', price: 10.0, duration: 60, location: 'Location 1', working_hours: '9am-6pm', image_url: 'image1.jpg', contact: 'Contact 1', user: user) }

            let(:id) {studio.id }

            before do
                sign_in user
            end

        run_test!
      end
    end
  end
end

RSpec.describe 'Api::V1::StudiosController', type: :request do
    path '/api/v1/studios/{id}' do
    delete 'Delete a studio' do
      tags 'Studios'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '204', 'Studio deleted successfully' do
        let(:user) { User.create!(username: 'Jude', email: 'jude@example.com', password: 'password', admin: true) }
        
        let(:studio) { Studio.create!(name: 'Studio 1', description: 'Description 1', price: 10.0, duration: 60, location: 'Location 1', working_hours: '9am-6pm', image_url: 'image1.jpg', contact: 'Contact 1', user: user) }

        let(:id) {studio.id }

        before do
          sign_in user
        end

        run_test!
      end

      response '401', 'Unauthorized - User is not authorized to delete a studio' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']

               let(:user) { User.create!(username: 'Sam', email: 'sam@example.com', password: 'password', admin: false) }
        
               let(:studio) { Studio.create!(name: 'Studio 1', description: 'Description 1', price: 10.0, duration: 60, location: 'Location 1', working_hours: '9am-6pm', image_url: 'image1.jpg', contact: 'Contact 1', user: user) }
       
               let(:id) {studio.id }

               before do
                user_to_sign_in = User.create!(username: 'Alice', email: 'alice@example.com', password: 'password')
                sign_in user_to_sign_in
              end

              run_test!
      end
    end
   end
end
