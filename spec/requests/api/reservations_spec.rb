require 'swagger_helper'

RSpec.describe 'Api::V1::ReservationsController', type: :request do
  path '/api/v1/studios/{studio_id}/reservations' do
    get 'Retrieve reservations' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :studio_id, in: :path, type: :integer

      response '200', 'Reservations retrieved successfully' do
        let(:user) { User.create!(username: 'Mike', email: 'mike@example.com', password: 'password', admin: true) }
        let(:studio) do
          Studio.create!(name: 'Studio 1', description: 'Description 1', price: 10.0, duration: 60, location: 'Location 1',
                         working_hours: '9am-6pm', image_url: 'image1.jpg', contact: 'Contact 1', user:)
        end

        let(:reservation1) do
          Reservation.create!(reservation_date: '01-11-2023', location: 'Mid-land', studio_id: studio.id,
                              user_id: user.id)
        end
        let(:reservation2) do
          Reservation.create!(reservation_date: '01-12-2023', location: 'Alaska', studio_id: studio.id,
                              user_id: user.id)
        end

        let(:studio_id) { studio.id }

        before do
          sign_in user
        end

        run_test! do |response|
          #   data = JSON.parse(response.body)
          #   expect(data.length).to eq(2)
          puts user.id
          puts studio.user_id
          puts studio.id
          puts reservation1.studio_id
          puts reservation2.location
          puts response.body
        end
      end

      response '401', 'Unauthorized - User is not signed in' do
        let(:user) { User.create!(username: 'Sam', email: 'sam@example.com', password: 'password', admin: false) }

        let(:studio) do
          Studio.create!(name: 'Studio 1', description: 'Description 1', price: 10.0, duration: 60, location: 'Location 1',
                         working_hours: '9am-6pm', image_url: 'image1.jpg', contact: 'Contact 1', user:)
        end

        let(:studio_id) { studio.id }

        run_test!
      end
    end

    post 'Create a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :studio_id, in: :path, type: :integer
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation_date: { type: :string },
          location: { type: :string }
        },
        required: %w[reservation_date location]
      }

      response '201', 'Reservation created successfully' do
        let(:user) { User.create!(username: 'Sam', email: 'sam@example.com', password: 'password', admin: false) }

        let(:studio) do
          Studio.create!(name: 'Studio 1', description: 'Description 1', price: 10.0, duration: 60, location: 'Location 1',
                         working_hours: '9am-6pm', image_url: 'image1.jpg', contact: 'Contact 1', user:)
        end

        let(:studio_id) { studio.id }

        let(:reservation) do
          Reservation.create!(reservation_date: '01-11-2023', location: 'Mid-land', studio_id: studio.id,
                              user_id: user.id)
        end

        before do
          sign_in user
        end

        run_test!
      end

      response '401', 'Unauthorized - User is not signed in' do
        let(:user) { User.create!(username: 'Sam', email: 'sam@example.com', password: 'password', admin: false) }

        let(:studio) do
          Studio.create!(name: 'Studio 1', description: 'Description 1', price: 10.0, duration: 60, location: 'Location 1',
                         working_hours: '9am-6pm', image_url: 'image1.jpg', contact: 'Contact 1', user:)
        end

        let(:studio_id) { studio.id }

        let(:reservation) do
          Reservation.create!(reservation_date: '01-11-2023', location: 'Mid-land', studio_id: studio.id,
                              user_id: user.id)
        end

        run_test!
      end
    end
  end

  path '/api/v1/studios/{studio_id}/reservations/{id}' do
    delete 'Delete a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :studio_id, in: :path, type: :integer
      parameter name: :id, in: :path, type: :integer

      response '200', 'Reservation deleted successfully' do
        let(:user) { User.create!(username: 'Sam', email: 'sam@example.com', password: 'password', admin: false) }

        let(:studio) do
          Studio.create!(name: 'Studio 1', description: 'Description 1', price: 10.0, duration: 60, location: 'Location 1',
                         working_hours: '9am-6pm', image_url: 'image1.jpg', contact: 'Contact 1', user:)
        end

        let(:studio_id) { studio.id }

        let(:reservation) do
          Reservation.create!(reservation_date: '01-11-2023', location: 'Mid-land', studio_id: studio.id,
                              user_id: user.id)
        end

        let(:id) { reservation.id }

        before do
          sign_in user
        end

        run_test!
      end

      response '401', 'Unauthorized - User is not authorized to delete this reservation' do
        let(:user) { User.create!(username: 'Sam', email: 'sam@example.com', password: 'password', admin: false) }
        let(:user2) { User.create!(username: 'Jude', email: 'jude@example.com', password: 'password', admin: false) }

        let(:studio) do
          Studio.create!(name: 'Studio 1', description: 'Description 1', price: 10.0, duration: 60, location: 'Location 1',
                         working_hours: '9am-6pm', image_url: 'image1.jpg', contact: 'Contact 1', user:)
        end

        let(:studio_id) { studio.id }

        let(:reservation) do
          Reservation.create!(reservation_date: '01-11-2023', location: 'Mid-land', studio_id: studio.id,
                              user_id: user.id)
        end

        let(:id) { reservation.id }

        before do
          sign_in user2
        end

        run_test!
      end
    end
  end
end
